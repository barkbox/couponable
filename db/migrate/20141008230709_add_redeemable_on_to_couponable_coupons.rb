class AddRedeemableOnToCouponableCoupons < ActiveRecord::Migration
  def change
    add_column :couponable_coupons, :redeemable_on, :string
  end
end
