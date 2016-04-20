class RenameProductColumn < ActiveRecord::Migration
  def change
  	rename_column :products, :seller_id, :sellerIDnumber
  	rename_column :products, :buyer_id, :buyerIDnumber
  end
end
