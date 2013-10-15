class AddValidDurationsToCoupons < ActiveRecord::Migration
  def change
    add_column :couponable_coupons, :valid_durations, :string
  end
end
