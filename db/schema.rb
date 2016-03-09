# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160309015408) do

  create_table "academy_applications", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "country"
    t.string   "email"
    t.integer  "age"
    t.string   "gender"
    t.string   "one_line"
    t.text     "reason"
    t.text     "info"
    t.text     "passion"
    t.text     "experience"
    t.text     "challenge"
    t.text     "special"
    t.text     "links"
    t.string   "referral"
    t.boolean  "visa"
    t.string   "programme_choice"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "phone"
    t.boolean  "in_spreadsheet",   default: false
    t.integer  "course_intake_id"
  end

  create_table "course_intakes", force: :cascade do |t|
    t.date     "start_date"
    t.date     "finish_date"
    t.string   "campus"
    t.integer  "class_size"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "enquiries", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "enquiry_type"
    t.boolean  "in_spreadsheet", default: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "info_session_attendees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.date     "session_date"
    t.integer  "info_session_date_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "in_spreadsheet",       default: false
  end

  create_table "info_session_dates", force: :cascade do |t|
    t.date     "session_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "mailing_list_users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "lead"
    t.text     "content"
    t.string   "image"
    t.boolean  "publish"
    t.date     "published_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "slug"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "image"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "women_in_tech_scholarships", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.text     "reason"
    t.text     "career"
    t.string   "links"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "age"
    t.boolean  "accepted_terms"
    t.string   "portfolio"
    t.integer  "course_intake_id"
  end

  create_table "workshop_attendees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.date     "session_date"
    t.integer  "workshop_date_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "in_spreadsheet",   default: false
  end

  create_table "workshop_dates", force: :cascade do |t|
    t.date     "session_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
