class ModifyForeignKeys < ActiveRecord::Migration
  def change
  	remove_index :products, column: :buyer_id
  	remove_index :products, column: :seller_id

  	add_foreign_key :products, :users, column: :seller_id
  	add_foreign_key :products, :users, column: :buyer_id
  end
end
