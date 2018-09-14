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

ActiveRecord::Schema.define(version: 2018_09_14_103152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "account_id"
    t.integer "property_id"
    t.date "date"
    t.boolean "confirmed"
    t.index ["account_id"], name: "index_bookings_on_account_id"
    t.index ["property_id"], name: "index_bookings_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "account_id"
    t.text "description"
  end

  add_foreign_key "properties", "accounts"
end
