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
        
          has_many :coupons, :class_name => 'Couponable::Coupon', :as => :couponable

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