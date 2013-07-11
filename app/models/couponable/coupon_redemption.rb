module Couponable
  class CouponRedemption < ActiveRecord::Base
    attr_accessible :coupon_id, :user_id, :coupon_redeemable

    belongs_to :coupon_redeemable, :polymorphic => true
    belongs_to :coupon
    belongs_to :user
    
  end
end
