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

ActiveRecord::Schema.define(version: 20161010103841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.text     "commentary"
    t.boolean  "incident"
    t.string   "incident_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "training_id"
    t.index ["training_id"], name: "index_attendances_on_training_id", using: :btree
    t.index ["user_id"], name: "index_attendances_on_user_id", using: :btree
  end

  create_table "memberships", force: :cascade do |t|
    t.string   "period"
    t.string   "membership_type"
    t.float    "fee"
    t.boolean  "fee_is_paid"
    t.boolean  "application_ok"
    t.boolean  "medical_certificate_ok"
    t.text     "commentary"
    t.string   "status"
    t.string   "license_number"
    t.string   "club_number"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_memberships_on_user_id", using: :btree
  end

  create_table "trainings", force: :cascade do |t|
    t.datetime "date_time"
    t.string   "duration"
    t.string   "theme"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainings_board_members", id: false, force: :cascade do |t|
    t.integer "trainings_id"
    t.integer "board_members_id"
    t.index ["board_members_id"], name: "index_trainings_board_members_on_board_members_id", using: :btree
    t.index ["trainings_id"], name: "index_trainings_board_members_on_trainings_id", using: :btree
  end

  create_table "trainings_teachers", id: false, force: :cascade do |t|
    t.integer "trainings_id"
    t.integer "teachers_id"
    t.index ["teachers_id"], name: "index_trainings_teachers_on_teachers_id", using: :btree
    t.index ["trainings_id"], name: "index_trainings_teachers_on_trainings_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                          default: "", null: false
    t.string   "encrypted_password",             default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.date     "date_of_birth"
    t.string   "birthplace_city"
    t.string   "birthplace_postcode"
    t.string   "birthplace_country"
    t.boolean  "is_board_member"
    t.boolean  "is_teacher"
    t.string   "mobile_phone"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_phone"
    t.string   "emergency_contact_relationship"
    t.string   "photo"
    t.string   "gender"
    t.string   "address"
    t.string   "postcode"
    t.string   "city"
    t.string   "country"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "attendances", "trainings"
  add_foreign_key "attendances", "users"
  add_foreign_key "memberships", "users"
end
