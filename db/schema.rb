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

ActiveRecord::Schema.define(:version => 20131121221330) do

  create_table "orders", :force => true do |t|
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.string   "label"
    t.string   "shipment_id"
  end

  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "hashed_password"
    t.string   "last_4_digits"
    t.string   "stripe_id"
    t.boolean  "subscribed",             :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.string   "status"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "most_recent_charge"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
