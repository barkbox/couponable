class CreateCouponableCoupons < ActiveRecord::Migration
  def change
    if !ActiveRecord::Base.connection.table_exists? 'couponable_coupons'
      create_table :couponable_coupons do |t|
        t.string :name
        t.string :code
        t.integer :trial_duration
        t.string :trial_duration_unit
        t.integer :discount_amount_cents
        t.string :discount_lifespan
        t.integer :discount_lifespan_billing_cycles
        t.integer :max_redemptions
        t.datetime :expires_at
        t.string :couponable_type
        t.integer :couponable_id
        t.string :type

        t.timestamps
      end
      add_index :couponable_coupons, :code, :unique => true
    end
  end
end
