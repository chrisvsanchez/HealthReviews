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

ActiveRecord::Schema.define(version: 2020_07_27_224550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "healthsystems", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "speciality"
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_hospitals_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "state"
    t.string "city"
    t.integer "zip"
    t.bigint "healthsystem_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["healthsystem_id"], name: "index_locations_on_healthsystem_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "hospital_id", null: false
    t.bigint "healthsystem_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["healthsystem_id"], name: "index_reviews_on_healthsystem_id"
    t.index ["hospital_id"], name: "index_reviews_on_hospital_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password"
    t.boolean "is_employee"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "hospitals", "locations"
  add_foreign_key "locations", "healthsystems"
  add_foreign_key "reviews", "healthsystems"
  add_foreign_key "reviews", "hospitals"
  add_foreign_key "reviews", "users"
end
