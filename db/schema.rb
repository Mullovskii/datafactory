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

ActiveRecord::Schema.define(version: 20171119193420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.boolean "sales_region"
    t.boolean "importer_region"
    t.integer "market_volume"
    t.integer "users"
    t.integer "shoppers"
    t.integer "game_market"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "habbits", force: :cascade do |t|
    t.bigint "country_id"
    t.bigint "system_id"
    t.decimal "share"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_habbits_on_country_id"
    t.index ["system_id"], name: "index_habbits_on_system_id"
  end

  create_table "settings", force: :cascade do |t|
    t.integer "average_bill"
    t.decimal "yandex_net_fee"
    t.decimal "yandex_share"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "setups", force: :cascade do |t|
    t.bigint "website_id"
    t.integer "average_bill"
    t.decimal "yandex_net_fee"
    t.decimal "yandex_share"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["website_id"], name: "index_setups_on_website_id"
  end

  create_table "systems", force: :cascade do |t|
    t.string "name"
    t.integer "payment_type"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "traffics", force: :cascade do |t|
    t.bigint "country_id"
    t.bigint "website_id"
    t.decimal "country_share"
    t.bigint "country_visits"
    t.decimal "bounce_rate"
    t.bigint "country_visitors"
    t.bigint "annual_turnover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_traffics_on_country_id"
    t.index ["website_id"], name: "index_traffics_on_website_id"
  end

  create_table "websites", force: :cascade do |t|
    t.bigint "country_id"
    t.string "url"
    t.bigint "company_id"
    t.integer "category"
    t.text "description"
    t.text "contacts"
    t.bigint "monthly_visits"
    t.integer "country_rank"
    t.boolean "valid_for_yandex"
    t.integer "status"
    t.decimal "bounce_rate"
    t.index ["company_id"], name: "index_websites_on_company_id"
    t.index ["country_id"], name: "index_websites_on_country_id"
  end

  add_foreign_key "habbits", "countries"
  add_foreign_key "habbits", "systems"
  add_foreign_key "setups", "websites"
  add_foreign_key "traffics", "countries"
  add_foreign_key "traffics", "websites"
  add_foreign_key "websites", "companies"
  add_foreign_key "websites", "countries"
end
