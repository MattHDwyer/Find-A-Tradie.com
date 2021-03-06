# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_07_033620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "business_profile_trades", force: :cascade do |t|
    t.bigint "business_profile_id"
    t.bigint "trade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_profile_id"], name: "index_business_profile_trades_on_business_profile_id"
    t.index ["trade_id"], name: "index_business_profile_trades_on_trade_id"
  end

  create_table "business_profiles", force: :cascade do |t|
    t.text "business_profile_description"
    t.string "australian_business_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "business_name"
    t.index ["user_id"], name: "index_business_profiles_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.string "mobile_number"
    t.string "landline_number"
    t.string "full_address"
    t.float "latitude"
    t.float "longitude"
    t.bigint "business_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_profile_id"], name: "index_contacts_on_business_profile_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.date "end_date"
    t.bigint "business_profile_id"
    t.index ["business_profile_id"], name: "index_memberships_on_business_profile_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "business_profile_id"
    t.string "user_name"
    t.integer "star_rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_profile_id"], name: "index_ratings_on_business_profile_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "privilege"
    t.string "role_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trades", force: :cascade do |t|
    t.string "trade_name"
    t.text "trade_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "role_id"
    t.string "first_name"
    t.string "last_name"
    t.string "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "business_profile_trades", "business_profiles"
  add_foreign_key "business_profile_trades", "trades"
  add_foreign_key "business_profiles", "users"
  add_foreign_key "contacts", "business_profiles"
  add_foreign_key "memberships", "business_profiles"
  add_foreign_key "ratings", "business_profiles"
end
