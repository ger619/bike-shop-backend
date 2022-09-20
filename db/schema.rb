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

ActiveRecord::Schema[7.0].define(version: 2022_09_19_132403) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "motorcycle_reservations", force: :cascade do |t|
    t.bigint "motorcycle_id_id", null: false
    t.bigint "reservation_id_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["motorcycle_id_id"], name: "index_motorcycle_reservations_on_motorcycle_id_id"
    t.index ["reservation_id_id"], name: "index_motorcycle_reservations_on_reservation_id_id"
  end

  create_table "motorcycles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "productID"
    t.string "brand"
    t.string "model"
    t.string "year"
    t.string "image"
    t.integer "booking_fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_motorcycles_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "total_price"
    t.date "start_date"
    t.date "end_date"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "motorcycle_reservations", "motorcycles", column: "motorcycle_id_id"
  add_foreign_key "motorcycle_reservations", "reservations", column: "reservation_id_id"
  add_foreign_key "motorcycles", "users"
  add_foreign_key "reservations", "users"
end
