class AddUniqueIndexOnCodeValidDurationAndRedeemableOn < ActiveRecord::Migration
  def up
    remove_index :couponable_coupons, [:code, :valid_duration]
    add_index :couponable_coupons, [:code, :valid_duration, :redeemable_on], unique: true, name: 'index_couponable_coupons_on_code_valid_duration_redeemable_on'
  end

  def down
    remove_index :couponable_coupons, [:code, :valid_duration, :redeemable_on], name: 'index_couponable_coupons_on_code_valid_duration_redeemable_on'
    add_index :couponable_coupons, [:code, :valid_duration], unique: true
  end
end