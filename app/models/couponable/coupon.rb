class Couponable::Coupon < ActiveRecord::Base
  attr_accessible :code, :discount_amount_cents, :discount_lifespan, :discount_lifespan_billing_cycles,
                  :expires_at, :max_redemptions, :name, :trial_duration, :trial_duration_unit

  belongs_to :couponable, :polymorphic => true

  has_many :coupon_redemptions

  def self.attributes_protected_by_default
    ["id"]
  end
  
  def is_valid?
    (self.expires_at >= DateTime.now) && (coupon_redemptions.count < max_redemptions)
  end

  def discount_duration
    case self.discount_lifespan
    when "single_use"
      1
    when "limited"
      self.discount_lifespan_billing_cycles
    else
      -1
    end
  end

  def discount_hash
    hash = {
      :inherited_from_id => "DISCOUNT",
      :amount => BigDecimal.new("#{self.discount_amount_cents/100}"),
    }
    if self.discount_lifespan == "forever"
      hash[:never_expires] = true
    else
      hash[:number_of_billing_cycles] = self.discount_duration
    end

    { :add => [ hash ] }
  end

  class << self

    def random_code prefix="", length=16
      charset = ('A'..'Z').to_a + (0..9).to_a
      prefix + (0..(length-prefix.length)).collect{ charset[Random.rand(charset.length)] }.join
    end
  end

end
