class ProductController < ApplicationController
  def all_products
    puts "Loading all products from database..."
    @products = Product.order(id: :desc).where(sell_status: "true") #PULLS ITEMS THAT HAVE NOT BEEN BOUGHT
    render "index"
  end

  def buy_product
    puts "Loading buy product page..."
    @products = Product.find(params[:id])
    @user = User.find_by_id(session[:user_id])
    render "buy_product"
  end

  def new_product
    puts "Loading new product form..."
    @user = User.find_by_id(session[:user_id])
    render "new_product"
  end

  def add_product_db
    puts "Adding new product to database..."
    @products = Product.create(product_name: params[:product_name], product_description: params[:product_description], product_price: params[:product_price], sell_status: params[:sell_status], bought_status: params[:bought_status], sellerIDnumber: params[:sellerIDnumber])
    puts "Redirecting from NEW_PRODUCT method to USER_DASHBOARD method..."
    flash[:notice] = "Item successfully added"
    redirect_to "/user_dashboard"
  end

  def update_product
    puts "Updating product status in database..."
    @products = Product.update(params[:id], sell_status: params[:sell_status],  bought_status: params[:bought_status], buyerIDnumber: params[:buyerIDnumber])
    puts "Redirecting from UPDATE_PRODUCT method to ALL_PRODUCTS method..."
    redirect_to "/all_products"
  end

  def delete_product
    puts "Deleting product from database..."
    @products = Product.destroy(params[:id])
    flash[:notice] = "Item successfully deleted"
    redirect_to "/user_dashboard"
  end
end
