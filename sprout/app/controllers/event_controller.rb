class EventController < ApplicationController
	def search
		flash[:notice] = "Item successfully searched"
		redirect_to "/"
	end

	def create
		puts "Validating form data..."
		@event = Event.new(title: params[:event_title], description: params[:event_description], location: params[:event_location], start_date: params[:event_start_date], start_time: params[:event_start_time], end_date: params[:event_end_date], end_time: params[:event_end_time])
    	
    	puts "Adding new user to database..."
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
	def to_create_event
		render "create_event"
	end
end
