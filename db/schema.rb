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

ActiveRecord::Schema[7.0].define(version: 2022_09_01_212700) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkpoints", force: :cascade do |t|
    t.string "title", limit: 100, default: "", null: false
    t.text "description", default: "", null: false
    t.datetime "start", default: "2022-09-01 21:36:04", null: false
    t.datetime "end", default: "2022-09-01 21:36:04", null: false
    t.float "longitude", default: 0.0, null: false
    t.float "latitude", default: 0.0, null: false
    t.float "longitude_delta", default: 0.0, null: false
    t.float "latitude_delta", default: 0.0, null: false
    t.string "location", limit: 100, default: "Unknown", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_checkpoints_on_description"
    t.index ["location"], name: "index_checkpoints_on_location"
    t.index ["title"], name: "index_checkpoints_on_title"
    t.index ["trip_id"], name: "index_checkpoints_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "title", limit: 100, default: "", null: false
    t.text "description", default: "", null: false
    t.datetime "start", default: "2022-09-01 21:35:36", null: false
    t.datetime "end", default: "2022-09-01 21:35:36", null: false
    t.float "longitude", null: false
    t.float "latitude", null: false
    t.float "longitude_delta", null: false
    t.float "latitude_delta", null: false
    t.string "location", limit: 100, default: "Unknown", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_trips_on_description"
    t.index ["location"], name: "index_trips_on_location"
    t.index ["title"], name: "index_trips_on_title"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 32, null: false
    t.string "email", limit: 64, null: false
    t.string "password_digest", limit: 64, null: false
    t.text "bio", default: "", null: false
    t.string "avatar"
    t.string "first_name", limit: 32, default: "", null: false
    t.string "last_name", limit: 32, default: "", null: false
    t.string "location", limit: 32, default: "", null: false
    t.datetime "birthday", default: "2022-09-01 21:32:22", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "checkpoints", "trips"
  add_foreign_key "trips", "users"
end
