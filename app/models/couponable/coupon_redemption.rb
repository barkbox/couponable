module Couponable
  class CouponRedemption < ActiveRecord::Base
    attr_accessible :coupon_id, :user_id, :coupon_redeemable

    belongs_to :coupon_redeemable, :polymorphic => true
    belongs_to :coupon, :class_name => 'Couponable::Coupon'
    belongs_to :user

    after_create :on_redeem

    def on_redeem
      coupon.redemption_added(self)
    end


  end
end
