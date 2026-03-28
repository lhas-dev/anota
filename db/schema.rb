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

ActiveRecord::Schema[8.1].define(version: 2026_03_28_113019) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "habit_trackings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "habit_id", null: false
    t.integer "score", default: 10, null: false
    t.date "tracked_on", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["habit_id", "tracked_on"], name: "index_habit_trackings_on_habit_id_and_tracked_on", unique: true
    t.index ["habit_id"], name: "index_habit_trackings_on_habit_id"
    t.index ["user_id", "tracked_on"], name: "index_habit_trackings_on_user_id_and_tracked_on"
    t.index ["user_id"], name: "index_habit_trackings_on_user_id"
  end

  create_table "habits", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name", null: false
    t.integer "position", default: 0, null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_habits_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "habit_trackings", "habits"
  add_foreign_key "habit_trackings", "users"
  add_foreign_key "habits", "users"
  add_foreign_key "sessions", "users"
end
