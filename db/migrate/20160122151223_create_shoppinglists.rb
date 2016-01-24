class CreateShoppinglists < ActiveRecord::Migration
  def change
    create_table :shoppinglists do |t|
      t.integer :manipulator_type 
      t.float :total 
      t.datetime :time 

      t.belongs_to :manipulator 
      t.timestamps null: false
    end
  end
end
