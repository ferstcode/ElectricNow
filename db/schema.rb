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

ActiveRecord::Schema.define(version: 2019_03_04_231456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "controllers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "users"
    t.string "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_controllers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_controllers_on_reset_password_token", unique: true
  end

  create_table "detections", force: :cascade do |t|
    t.bigint "user_id"
    t.text "detail"
    t.string "image"
    t.string "address"
    t.string "commune"
    t.date "date"
    t.time "hour"
    t.integer "state_mode"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_detections_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.bigint "user_id"
    t.text "detail"
    t.integer "calification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_qualifications_on_user_id"
  end

  create_table "quatations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "detection_id"
    t.text "detail"
    t.integer "amount"
    t.date "date"
    t.time "hour"
    t.integer "state_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detection_id"], name: "index_quatations_on_detection_id"
    t.index ["user_id"], name: "index_quatations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "rut"
    t.string "address"
    t.string "commune"
    t.string "image"
    t.integer "rol"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "detections", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "qualifications", "users"
  add_foreign_key "quatations", "detections"
  add_foreign_key "quatations", "users"
end
