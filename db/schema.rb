# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_10_021602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charge_fees", force: :cascade do |t|
    t.float "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "charge_values", force: :cascade do |t|
    t.float "value"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_charge_values_on_customer_id"
  end

  create_table "charge_volumes", force: :cascade do |t|
    t.float "value"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_charge_volumes_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.float "value"
    t.integer "quantity"
    t.integer "quantity_used"
    t.bigint "customer_id", null: false
    t.boolean "active"
    t.boolean "no_limit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_discounts_on_customer_id"
  end

  add_foreign_key "charge_values", "customers"
  add_foreign_key "charge_volumes", "customers"
  add_foreign_key "discounts", "customers"
end
