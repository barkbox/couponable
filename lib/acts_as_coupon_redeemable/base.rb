module Couponable
  module ActsAsCouponRedeemable

    module Base

      def self.included(klass)
        klass.class_eval do
          extend Config
        end
      end
      
      module Config
        def acts_as_coupon_redeemable
        
          has_many :coupon_redemptions, :class_name => 'Couponable::CouponRedemption', foreign_key: :coupon_redeemable_id
          has_many :couponable_coupons, through: :coupon_redemptions, source: :coupon

          include Couponable::ActsAsCouponRedeemable::Base::InstanceMethods
        end
      end
      
      module InstanceMethods
        
        def factory_name
          "this is an example instance method"
        end
                
      end

    end

  end
end

::ActiveRecord::Base.send :include, Couponable::ActsAsCouponRedeemable::Base