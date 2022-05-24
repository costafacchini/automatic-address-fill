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

ActiveRecord::Schema[7.0].define(version: 2022_05_24_002113) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "postal_code"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "street_id", null: false
    t.bigint "street_number_id", null: false
    t.index ["city_id"], name: "index_people_on_city_id"
    t.index ["street_id"], name: "index_people_on_street_id"
    t.index ["street_number_id"], name: "index_people_on_street_number_id"
  end

  create_table "postal_codes", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id", null: false
    t.index ["city_id"], name: "index_postal_codes_on_city_id"
  end

  create_table "street_numbers", force: :cascade do |t|
    t.string "number"
    t.bigint "street_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["street_id"], name: "index_street_numbers_on_street_id"
  end

  create_table "streets", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_streets_on_city_id"
  end

  add_foreign_key "people", "cities"
  add_foreign_key "people", "street_numbers", on_delete: :restrict
  add_foreign_key "people", "streets", on_delete: :restrict
  add_foreign_key "postal_codes", "cities", on_delete: :restrict
  add_foreign_key "street_numbers", "streets"
  add_foreign_key "streets", "cities"
end
