class AddValidDurationToCouponableCoupons < ActiveRecord::Migration
  def change
    add_column :couponable_coupons, :valid_duration, :integer
  end
end
