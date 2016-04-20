class CreateIteneraries < ActiveRecord::Migration
  def change
    create_table :iteneraries do |t|

      t.timestamps null: false
    end
  end
end
