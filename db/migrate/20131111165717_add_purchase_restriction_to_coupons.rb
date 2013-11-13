class AddPurchaseRestrictionToCoupons < ActiveRecord::Migration
  def change
    add_column :couponable_coupons, :purchase_restriction, :string
  end
end
