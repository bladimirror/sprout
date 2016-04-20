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

ActiveRecord::Schema.define(version: 20160417024806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "location"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "itineries", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "arrival_date"
    t.date     "departure_date"
    t.string   "lodging_info"
    t.string   "travel_status"
    t.string   "travel_group"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "itineries", ["user_id"], name: "index_itineries_on_user_id", using: :btree

  create_table "user_events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rsvp_id"
    t.integer  "bookmarked_id"
    t.integer  "past_rsvp_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_events", ["bookmarked_id"], name: "index_user_events_on_bookmarked_id", using: :btree
  add_index "user_events", ["past_rsvp_id"], name: "index_user_events_on_past_rsvp_id", using: :btree
  add_index "user_events", ["rsvp_id"], name: "index_user_events_on_rsvp_id", using: :btree
  add_index "user_events", ["user_id"], name: "index_user_events_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "city_of_residence"
    t.string   "state_of_residence"
    t.text     "about_me"
    t.integer  "friend_list"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_foreign_key "itineries", "users"
  add_foreign_key "user_events", "events", column: "bookmarked_id"
  add_foreign_key "user_events", "events", column: "past_rsvp_id"
  add_foreign_key "user_events", "events", column: "rsvp_id"
  add_foreign_key "user_events", "users"
end
