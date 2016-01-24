class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :p_name 
      t.string :description
      t.float:price 
      t.integer :quantity
      
      t.timestamps null: false
    end
  end
end
