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

ActiveRecord::Schema.define(version: 20211202010917) do

  create_table "announcements", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "rating"
    t.text     "description"
    t.datetime "release_date"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "rating"
    t.text     "description"
    t.datetime "release_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "director"
  end

  create_table "my_accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "research_interest_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "research_interests", force: :cascade do |t|
    t.string   "field"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "research_interests_users", id: false, force: :cascade do |t|
    t.integer "user_id",              null: false
    t.integer "research_interest_id", null: false
  end

  add_index "research_interests_users", ["research_interest_id", "user_id"], name: "ru_id"
  add_index "research_interests_users", ["user_id", "research_interest_id"], name: "ur_id"

  create_table "user_events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "user_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_events", ["event_id"], name: "index_user_events_on_event_id"

  create_table "users", force: :cascade do |t|
    t.string   "account_name"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "organization"
    t.string   "email"
    t.string   "phone"
    t.integer  "mentor"
    t.integer  "mentee"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
