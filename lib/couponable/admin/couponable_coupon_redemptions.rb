if defined?(ActiveAdmin)
  ActiveAdmin.register Couponable::CouponRedemption do
    menu :parent => "Couponable", :label => "Coupon Redemptions"
    
    config.sort_order = "id_desc"
    
  end
end