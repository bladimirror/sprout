class Event < ActiveRecord::Base
	has_many :user_events
end
