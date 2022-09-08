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


ActiveRecord::Schema[7.0].define(version: 2022_09_08_173255) do
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trip_id"
    t.index ["description"], name: "index_checkpoints_on_description"
    t.index ["location"], name: "index_checkpoints_on_location"
    t.index ["title"], name: "index_checkpoints_on_title"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "trip_id"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
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
    t.string "email", limit: 64, null: false
    t.text "bio", default: "", null: false
    t.string "avatar"
    t.string "first_name", limit: 32, default: "", null: false
    t.string "last_name", limit: 32, default: "", null: false
    t.string "location", limit: 32, default: "", null: false
    t.datetime "birthday", default: "2022-09-01 21:32:22", null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "jti", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "comments", column: "parent_id"
  add_foreign_key "comments", "comments", column: "reply_id"
  add_foreign_key "comments", "users"
  add_foreign_key "trips", "users"
end
