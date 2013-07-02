if defined?(ActiveAdmin)
  ActiveAdmin.register Couponable::CouponRedemption do
    menu :parent => "Couponable", :label => "Coupon Redemption"
    
    config.sort_order = "id_desc"
    
  end
end