class CreateCouponableCouponRedemptions < ActiveRecord::Migration
  def change
    create_table :couponable_coupon_redemptions do |t|
      t.integer :coupon_id
      t.integer :user_id
      t.integer :coupon_redeemable_id
      t.string  :coupon_redeemable_type

      t.timestamps
    end
    add_index :couponable_coupon_redemptions, :coupon_id
    add_index :couponable_coupon_redemptions, :user_id
    add_index :couponable_coupon_redemptions, :coupon_redeemable_id
    add_index :couponable_coupon_redemptions, :coupon_redeemable_type
  end
end
