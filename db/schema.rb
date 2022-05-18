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

ActiveRecord::Schema.define(version: 2022_05_13_023128) do

  create_table "accounts", force: :cascade do |t|
    t.string "email"
    t.integer "role_id", default: 3, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_accounts_on_role_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "cost"
    t.integer "status"
    t.integer "account_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_bookings_on_account_id"
    t.index ["room_id"], name: "index_bookings_on_room_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.datetime "dob"
    t.integer "gender"
    t.integer "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_profiles_on_account_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.integer "uid"
    t.integer "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_providers_on_account_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "room_details", force: :cascade do |t|
    t.datetime "checkin"
    t.datetime "checkout"
    t.datetime "startday"
    t.datetime "endday"
    t.text "description"
    t.string "bedroom"
    t.integer "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_room_details_on_room_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.string "area"
    t.string "address"
    t.decimal "price", precision: 10, scale: 2
    t.integer "account_id", null: false
    t.integer "room_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_rooms_on_account_id"
    t.index ["room_type_id"], name: "index_rooms_on_room_type_id"
  end

  add_foreign_key "accounts", "roles"
  add_foreign_key "bookings", "accounts"
  add_foreign_key "bookings", "rooms"
  add_foreign_key "profiles", "accounts"
  add_foreign_key "providers", "accounts"
  add_foreign_key "room_details", "rooms"
  add_foreign_key "rooms", "accounts"
  add_foreign_key "rooms", "room_types"
end
