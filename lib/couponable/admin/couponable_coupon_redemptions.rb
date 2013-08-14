if defined?(ActiveAdmin)
  ActiveAdmin.register Couponable::CouponRedemption do
    menu :parent => "Couponable", :label => "Coupon Redemptions"
    
    filter :coupon_code, :label => 'Code', :as => :string
    filter :user_email, :as => :string
    
    config.sort_order = "id_desc"
    
  end
end