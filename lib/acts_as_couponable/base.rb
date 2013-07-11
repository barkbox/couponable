module Couponable
  module ActsAsCouponable

    module Base

      def self.included(klass)
        klass.class_eval do
          extend Config
        end
      end
      
      module Config
        def acts_as_couponable
        
          has_many :coupons, :class_name => 'Couponable::Coupon', :as => :couponable, :autosave => true

          include Couponable::ActsAsCouponable::Base::InstanceMethods
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

::ActiveRecord::Base.send :include, Couponable::ActsAsCouponable::Base