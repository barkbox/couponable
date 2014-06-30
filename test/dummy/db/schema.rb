# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140613185957) do

  create_table "couponable_coupon_redemptions", :force => true do |t|
    t.integer  "coupon_id"
    t.integer  "user_id"
    t.integer  "coupon_redeemable_id"
    t.string   "coupon_redeemable_type"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "couponable_coupon_redemptions", ["coupon_id"], :name => "index_couponable_coupon_redemptions_on_coupon_id"
  add_index "couponable_coupon_redemptions", ["coupon_redeemable_id"], :name => "index_couponable_coupon_redemptions_on_coupon_redeemable_id"
  add_index "couponable_coupon_redemptions", ["coupon_redeemable_type"], :name => "index_couponable_coupon_redemptions_on_coupon_redeemable_type"
  add_index "couponable_coupon_redemptions", ["user_id"], :name => "index_couponable_coupon_redemptions_on_user_id"

  create_table "couponable_coupons", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "trial_duration"
    t.string   "trial_duration_unit"
    t.integer  "discount_amount_cents"
    t.string   "discount_lifespan"
    t.integer  "discount_lifespan_billing_cycles"
    t.integer  "max_redemptions"
    t.datetime "expires_at"
    t.string   "couponable_type"
    t.integer  "couponable_id"
    t.string   "type"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.string   "valid_durations"
    t.string   "discount_type",                    :default => "dollars", :null => false
    t.integer  "discount_percent"
    t.string   "couponable_restriction"
    t.integer  "valid_duration"
  end

end
