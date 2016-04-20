class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :product_description
      t.float :product_price
      t.boolean :sell_status
      t.boolean :bought_status
      t.references :seller, index: true, foreign_key: true
      t.references :buyer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
