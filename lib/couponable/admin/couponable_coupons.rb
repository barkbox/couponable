if defined?(ActiveAdmin)
  ActiveAdmin.register Couponable::Coupon do
    menu :parent => "Couponable", :label => "Coupons"
    
    filter :code, :label => 'Code', :as => :string

    action_item do
      link_to('Bulk Create Coupons', bulk_new_admin_couponable_coupons_path)
    end

    collection_action :bulk_new, :method => :get do
      @coupon = Couponable::Coupon.new
    end

    collection_action :bulk_create, :method => :post do
      Rails.logger.debug "bulk_create: #{params.inspect}"
      coupon_count = params[:coupon_count].to_i
      begin
        Coupon.transaction do
          coupon_count.times do
            params[:coupon][:code] = Couponable::Coupon.random_code params[:coupon_code_prefix]
            @coupon = Coupon.create(params[:coupon])
          end
        end
      rescue => e
        Rails.logger.error "Coupon bulk creation exception. #{e.class}: #{e.message}"
        redirect_to admin_coupons_path, {:alert => "Bulk coupons creation failed!"}
      else
        redirect_to admin_coupons_path({:q => { :code_contains => "#{params[:coupon_code_prefix]}" }, :order => "id_desc"}),
                                     {:notice => "Bulk coupons successfully created!"}
      end
    end
    
    form do |f|
      f.inputs "Details" do
        f.input :code
        f.input :discount_amount_cents
        f.input :discount_lifespan, :as => :select, :collection => ['forever', 'single_use', 'limited']
        f.input :discount_lifespan_billing_cycles
        f.input :expires_at
        f.input :max_redemptions
        f.input :name
        f.input :trial_duration
        f.input :trial_duration_unit, :as => :select, :collection => ['day', 'month', 'year']
        f.input :type, :as => :select, :collection => ['NoBillingCoupon']
      end
      f.buttons
    end
    
    index do
      column :code
      column :type
      column :discount_amount_cents
      column :discount_lifespan
      column :discount_lifespan_billing_cycles
      column :expires_at
      column :max_redemptions
      column :name
      column :trial_duration
      column :trial_duration_unit
      
      default_actions
    end
    
    show do |ad|
      attributes_table do
        row :id
        row :name
        row :code
        row :type
        row :trial_duration
        row :trial_duration_unit
        row :discount_amount_cents
        row :discount_lifespan
        row :discount_lifespan_billing_cycles
        row :max_redemptions
        row :coupon_redemptions do
          couponable_coupon.coupon_redemptions.count
        end
        row :expires_at
        row :created_at
        row :updated_at
      end
      panel("Coupon Redemptions") do
        table_for(couponable_coupon.coupon_redemptions) do
          column :id do |coupon_redemption|
            link_to coupon_redemption.id, admin_couponable_coupon_redemption_path(coupon_redemption)
          end
          column :coupon_redeemable
          column :user
          column :created_at
        end
      end
      active_admin_comments
    end
  end
end
