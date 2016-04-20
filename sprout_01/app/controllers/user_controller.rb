class UserController < ApplicationController

##### METHOD LOADS LOG-IN PAGE ##### 
  def index
    puts "Loading registration and login page..."
    if session[:status] == "new_session"
      session[:registration_error_status] = false
      session[:login_error_status] = false
      session[:status] = nil
    end
    render "index"
  end

##### METHOD ADD'S NEW USER TO DATABASE #####
  def new_user
    puts "Validating form data..."
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
    
    if @user.valid?
      puts "Adding new user to database..."
      @user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
      
      puts "Redirecting from NEW_USER method to ALL_PRODUCTS method..."
      session[:user_id] = @user.id
      session[:status] = "new_user"
      render "user_dashboard", notice: "User was successfully created!"
    else
      @errors = @user.errors.full_messages
      session[:registration_error_status] = true
      print "\nErrors in form... %s\n" % [@errors]
      render "index"
    end
  end

##### METHOD LOG'S IN EXISTING USER #####
  def login_user
    @user = User.find_by_email(params[:login_email])
    if @user != nil
      if @user.email == params[:login_email] && @user.password == params[:login_password]
        session[:user_id] = @user.id
        session[:status] = "logged_in"
        puts "Loading User Dashboard..."
        render "user_dashboard"
      else
        session[:login_error_status] = true
        print "\nErrors in form...\n"
        render "index"
      end
    else
      session[:login_error_status] = true
      print "\nErrors in form...\n"
      render "index"
    end
  end

##### METHOD LOG'S USER OUT #####
  def logout
    session[:status] = "new_session"
    reset_session
    render "index"
  end

##### METHOD LOAD'S USER DATA WEBPAGE #####
  def user_dashboard
      puts "Loading user information..."
      @user = User.find_by_id(session[:user_id])
      @sell_products = Product.where(sellerIDnumber: @user.id, sell_status: "true")
      @sold_products = Product.where(sellerIDnumber: @user.id, sell_status: "false")
      @buy_products = Product.where(buyerIDnumber: @user.id)
      render "user_dashboard"
  end

##### METHOD FETCHES user DATA FROM THE DATABASE #####
  def update_user
    puts "Loading user update form..."
    @user = User.find(params[:id])
    render "update_user"
  end

##### METHOD UPDATES user DATA IN THE DATABASE #####
  def update_user_db
    puts "Updating user information in database..."
    @user = User.update(params[:id], first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
    puts "Redirecting from UPDATE_USER_DB method to ALL_PRODUCTS method..."
    redirect_to "all_products"
  end
end
