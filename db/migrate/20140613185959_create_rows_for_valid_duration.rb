class CreateRowsForValidDuration < ActiveRecord::Migration
  def up
    # for coupons with lists in valid_durations, create one row for each value
    Couponable::Coupon.where('valid_durations LIKE ?', '%,%').find_in_batches do |batch|
      batch.each do |coupon|
        coupon_attributes = coupon.attributes.except("id", "created_at", "updated_at", "valid_durations")

        coupon_valid_durations = coupon.valid_durations.split(',').map {|d| d.to_i }.sort

        if coupon_valid_durations == [1,3,6,12]
          new_coupon = Couponable::Coupon.create!(coupon_attributes)
        else
          coupon_valid_durations.each do |valid_duration|
            new_coupon = Couponable::Coupon.create!(coupon_attributes.merge(valid_duration: valid_duration))
          end
        end
      end
    end

    # populate valid_duration based on valid_durations
    query = %Q[
      UPDATE couponable_coupons
      SET valid_duration = valid_durations::int
      WHERE trim(valid_durations) IN ('1','3','6','12')
    ]
    ActiveRecord::Base.connection.execute(query)

    Couponable::Coupon.where('valid_durations LIKE ?', '%,%').destroy_all

    # clean up data
    query = %Q[
      UPDATE couponable_coupons
      SET discount_type = 'dollars'
      WHERE discount_type = '''dollars'''
    ]
    ActiveRecord::Base.connection.execute(query)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
