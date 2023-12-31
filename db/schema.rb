# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_05_124630) do
  create_table "disbursements", force: :cascade do |t|
    t.string "reference", null: false
    t.text "orders", null: false
    t.date "disbursed_at", null: false
    t.decimal "fee", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "merchant_id", null: false
    t.index ["merchant_id"], name: "index_disbursements_on_merchant_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "reference", null: false
    t.string "email", null: false
    t.date "live_on", null: false
    t.integer "disbursement_frequency", default: 0, null: false
    t.decimal "minimum_monthly_fee", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weekday", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "merchant_id", null: false
    t.decimal "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.string "merchant_reference", null: false
    t.index ["merchant_id"], name: "index_orders_on_merchant_id"
  end

  add_foreign_key "disbursements", "merchants"
  add_foreign_key "orders", "merchants"
end
