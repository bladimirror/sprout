class ProductForeignKey < ActiveRecord::Migration
  def change
  	remove_column :users, :sellerID
	remove_column :users, :buyerID
  end
end
