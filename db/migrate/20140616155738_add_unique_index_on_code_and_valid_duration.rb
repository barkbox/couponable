class AddUniqueIndexOnCodeAndValidDuration < ActiveRecord::Migration
  def change
    add_index :couponable_coupons, [:code, :valid_duration], unique: true
  end
end
