class UserController < ApplicationController
	def index
		render "login"
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
end
