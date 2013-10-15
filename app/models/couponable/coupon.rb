class Couponable::Coupon < ActiveRecord::Base
  attr_accessible :code, :discount_amount_cents, :discount_lifespan, :discount_lifespan_billing_cycles,
                  :expires_at, :max_redemptions, :name, :trial_duration, :trial_duration_unit, :type,
                  :valid_durations

  belongs_to :couponable, :polymorphic => true
  has_many :coupon_redemptions

  def self.attributes_protected_by_default
    ["id"]
  end
  
  def is_expired?
    self.expires_at.present? && self.expires_at < DateTime.now
  end

  def is_redeemed?
    max_redemptions.present? && coupon_redemptions.count >= max_redemptions
  end
  
  def applies_to_plan_duration? duration
    Rails.logger.debug "VALID DURATIONS: #{self.valid_durations.inspect}"
    return true if duration.nil? || self.valid_durations.nil?
    durations = self.valid_durations.split(',').map{|d| d.strip.to_i }
    return true if self.valid_durations.length == 0
    durations.include?(duration)
  end

  def is_valid?
    !is_expired? && !is_redeemed?
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
  
  def redemption_added
  end


  class << self

    def random_code prefix="", length=16
      charset = ('A'..'Z').to_a + (0..9).to_a
      prefix + (0...(length-prefix.length)).collect{ charset[Random.rand(charset.length)] }.join
    end
    
    def bulk_create count, options
      code_length = options[:code_length].to_i || 16
      count.times do
        attempts = 0
        until attempts >= 25
          options[:code] = Couponable::Coupon.random_code(options[:prefix], code_length)
          break if Couponable::Coupon.where(:code => options[:code]).length == 0
          attempts += 1
        end
        begin
          coupon = Couponable::Coupon.create(options)
        rescue => e
          Rails.logger.error "Unable to create coupon code #{code_length} characters long with options #{options.inspect}"
        end
      end
    end
  end

end
