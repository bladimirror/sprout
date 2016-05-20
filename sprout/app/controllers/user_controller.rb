class UserController < ApplicationController
	def index
		render "index"
	end

	def create
		flash[:notice] = "Item successfully added"
		redirect_to "/"
	end

	def read
	end 
	
	def update
	end

	def destroy
	end

	def user_dashboard
		render "user_dashboard"
	end
end
