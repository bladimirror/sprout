class ChangeDatabase < ActiveRecord::Migration
  def change
  	drop_table :products
  	drop_table :users

  	create_table "users", force: :cascade do |t|
	    t.string   "first_name"
	    t.string   "last_name"
	    t.string   "email"
	    t.string   "password"
	    t.string   "city_of_residence"
	    t.string   "state_of_residence"
	    t.text     "about_me"
	    t.integer  "friend_list"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
  	end

  	create_table "events", force: :cascade do |t|
	    t.string   "title"
	    t.string   "description"
	    t.string   "location"
	    t.date   "date"
	    t.time   "time"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
  	end

  	create_table "itineries", force: :cascade do |t|
  		t.references :user, reference: :users, index: true
	    t.date   "arrival_date"
	    t.date   "departure_date"
	    t.string   "lodging_info"
	    t.string   "travel_status"
	    t.string   "travel_group"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
  	end

  	create_table "user_events", force: :cascade do |t|
  		t.references :user, reference: :users, index: true
  		t.references :rsvp, reference: :events, index: true
  		t.references :bookmarked, reference: :events, index: true
  		t.references :past_rsvp, reference: :events, index: true
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
  	end

  	#FK FOR ITENERIES TABLE
  	add_foreign_key :itineries, :users, column: :user_id

  	#FK FOR USER EVENTS TABLE
  	add_foreign_key :user_events, :users, column: :user_id
  	add_foreign_key :user_events, :events, column: :rsvp_id
  	add_foreign_key :user_events, :events, column: :bookmarked_id
  	add_foreign_key :user_events, :events, column: :past_rsvp_id

  end
end




