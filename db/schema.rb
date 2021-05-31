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

ActiveRecord::Schema.define(version: 2021_05_31_001308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aide_categories", force: :cascade do |t|
    t.bigint "aide_id", null: false
    t.bigint "category_id", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aide_id"], name: "index_aide_categories_on_aide_id"
    t.index ["category_id"], name: "index_aide_categories_on_category_id"
  end

  create_table "aides", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", null: false
    t.index ["email"], name: "index_aides_on_email", unique: true
    t.index ["reset_password_token"], name: "index_aides_on_reset_password_token", unique: true
    t.index ["username"], name: "index_aides_on_username", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_cities_on_name", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
    t.index ["username"], name: "index_clients_on_username", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.string "userable_type", null: false
    t.bigint "userable_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_locations_on_city_id"
    t.index ["userable_type", "userable_id"], name: "index_locations_on_userable"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "room_id", null: false
    t.string "userable_type", null: false
    t.bigint "userable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["userable_type", "userable_id"], name: "index_messages_on_userable"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "aide_id", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aide_id", "client_id"], name: "index_rooms_on_aide_id_and_client_id", unique: true
    t.index ["aide_id"], name: "index_rooms_on_aide_id"
    t.index ["client_id"], name: "index_rooms_on_client_id"
  end

  create_table "starred_aides", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "aide_id", null: false
    t.index ["aide_id"], name: "index_starred_aides_on_aide_id"
    t.index ["client_id"], name: "index_starred_aides_on_client_id"
  end

  add_foreign_key "locations", "cities"
  add_foreign_key "messages", "rooms"
  add_foreign_key "starred_aides", "aides"
  add_foreign_key "starred_aides", "clients"
end
