class RemoveValidDurationsDiscountPercentDiscountAmountCents < ActiveRecord::Migration
  def up
    remove_column :couponable_coupons, :valid_durations
    remove_column :couponable_coupons, :discount_amount_cents
    remove_column :couponable_coupons, :discount_percent
  end

  def down
    add_column :couponable_coupons, :valid_durations, :string
    add_column :couponable_coupons, :discount_amount_cents, :integer
    add_column :couponable_coupons, :discount_percent, :integer
  end
end
