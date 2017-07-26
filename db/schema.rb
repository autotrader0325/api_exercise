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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170726044002) do

  create_table "tickers", force: :cascade do |t|
    t.string   "ticker_id"
    t.string   "ticker_name"
    t.integer  "timestamp_at"
    t.string   "price_buy"
    t.string   "price_sell"
    t.string   "price_low"
    t.string   "price_high"
    t.string   "price_last"
    t.string   "trade_vol"
    t.string   "current_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
