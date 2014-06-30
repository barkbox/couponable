class AddDiscountValueToCouponableCoupons < ActiveRecord::Migration
  def change
    add_column :couponable_coupons, :discount_value, :integer
  end
end
