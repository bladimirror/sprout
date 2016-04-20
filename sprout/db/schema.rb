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

ActiveRecord::Schema.define(version: 20160418171431) do

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "location"
    t.date     "date"
    t.time     "time"
    t.text     "guest_list"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "travels", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "arrival_date"
    t.date     "departure_date"
    t.string   "lodging_address"
    t.string   "city_of_travel"
    t.string   "country_of_travel"
    t.string   "travel_group_size"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "travels", ["user_id"], name: "index_travels_on_user_id"

  create_table "user_events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.boolean  "rsvp"
    t.boolean  "bookmarked"
    t.boolean  "hosted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_events", ["event_id"], name: "index_user_events_on_event_id"
  add_index "user_events", ["user_id"], name: "index_user_events_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.boolean  "transplant"
    t.string   "city_of_residence"
    t.string   "state_of_residence"
    t.string   "country_of_residence"
    t.text     "about_me"
    t.text     "friend_list"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
