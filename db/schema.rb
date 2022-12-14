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

ActiveRecord::Schema[7.0].define(version: 2022_08_23_093228) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rentals", force: :cascade do |t|
    t.datetime "starting_date"
    t.datetime "return_date"
    t.string "booking_status"
    t.bigint "user_id", null: false
    t.bigint "surfboard_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["surfboard_id"], name: "index_rentals_on_surfboard_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "surfboards", force: :cascade do |t|
    t.string "material_type"
    t.string "brand"
    t.float "price"
    t.string "shape"
    t.float "lenght"
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["user_id"], name: "index_surfboards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "surname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "rentals", "surfboards"
  add_foreign_key "rentals", "users"
  add_foreign_key "surfboards", "users"
end
