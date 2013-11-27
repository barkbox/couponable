class AddCouponableRestrictionToCouponableCoupons < ActiveRecord::Migration
  def change
    add_column :couponable_coupons, :couponable_restriction, :string
  end
end
