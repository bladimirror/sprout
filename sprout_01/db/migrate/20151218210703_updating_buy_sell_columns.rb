class UpdatingBuySellColumns < ActiveRecord::Migration
  def change
  	change_column :products, :sell_status, :text
  	change_column :products, :bought_status, :text
  end
end
