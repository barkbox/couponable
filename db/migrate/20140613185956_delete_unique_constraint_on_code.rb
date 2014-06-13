class DeleteUniqueConstraintOnCode < ActiveRecord::Migration
  def change
    remove_index :couponable_coupons, column: :code, unique: :true
  end
end
