class EventController < ApplicationController
	def search
		flash[:notice] = "Item successfully searched"
		redirect "/"
	end

	def create
		flash[:notice] = "Item successfully added"
		redirect "/"
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
