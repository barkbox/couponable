class PopulateDiscountValue < ActiveRecord::Migration
  def up
    percent_query = %Q[
      UPDATE couponable_coupons
      SET discount_value = discount_percent
      WHERE discount_type = 'percent'
    ]
    
    ActiveRecord::Base.connection.execute(percent_query)

    dollars_query = %Q[
      UPDATE couponable_coupons
      SET discount_value = discount_amount_cents
      WHERE discount_type = 'dollars'
    ]
    
    ActiveRecord::Base.connection.execute(dollars_query)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
