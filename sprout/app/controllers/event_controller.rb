class EventController < ApplicationController
	def search
		flash[:notice] = "Item successfully searched"
		redirect_to "/"
	end

	def create
		puts "Validating form data..."
		@event = Event.new(title: params[:event_title], description: params[:event_description], location: params[:event_location], start_date: params[:event_start_date], start_time: params[:event_start_time], end_date: params[:event_end_date], end_time: params[:event_end_time])
    	
    	puts "Adding new event to database..."
    	@event = Event.create(title: params[:event_title], description: params[:event_description], location: params[:event_location], start_date: params[:event_start_date], start_time: params[:event_start_time], end_date: params[:event_end_date], end_time: params[:event_end_time])
    	
		puts "Redirecting from EVENT#CREATE method to USER#INDEX method..."
    	flash[:notice] = "Event successfully created"
		redirect_to "/"
	end

	def read
	end 

	def update
	end

	def destroy
	end

	#ROUTING FUNCTIONS
	def event_list
		puts "Pulling event information from database..."
		@event = Event.order(start_date: :asc)
		render "event_search"
	end
	def create_event_form
		render "create_event"
	end

	def view_event
		puts "Loading event page..."
		@event = Event.find(params[:id])
		render "event_page"
	end
end
