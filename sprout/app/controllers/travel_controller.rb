class TravelController < ApplicationController
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
end
