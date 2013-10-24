class AddDiscountTypeAndDiscountPercentToCoupons < ActiveRecord::Migration
  def change
    add_column :couponable_coupons, :discount_type, :string, :null => false, :default => "dollars"
    add_column :couponable_coupons, :discount_percent, :integer
  end
end
