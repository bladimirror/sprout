class Modifydb < ActiveRecord::Migration
  def change
    drop_table :dbs
    drop_table :events
    drop_table :travels
    drop_table :users

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
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
  	end

  	create_table "events", force: :cascade do |t|
	    t.string   "title"
	    t.string   "description"
	    t.string   "location"
	    t.date   "date"
	    t.time   "time"
	    t.text   "guest_list"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
  	end

  	create_table "travels", force: :cascade do |t|
  		t.belongs_to :user, index: true
	    t.date   "arrival_date"
	    t.date   "departure_date"
	    t.string   "lodging_address"
	    t.string   "city_of_travel"
	    t.string   "country_of_travel"
	    t.string   "travel_group_size"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
  	end

  	create_table "user_events", force: :cascade do |t|
  		t.belongs_to :user, index: true
  		t.belongs_to :event, index: true
  		t.boolean "rsvp"
  		t.boolean "bookmarked"
  		t.boolean "hosted"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
  	end
  end
end
