class EditForeignKey < ActiveRecord::Migration
  def change
  	remove_foreign_key :products, column: :seller_id
  	remove_foreign_key :products, column: :buyer_id

  	add_column :users, :sellerID, :integer
	add_column :users, :buyerID, :integer	

  	add_foreign_key :products, :users, column: :id
  end
end
