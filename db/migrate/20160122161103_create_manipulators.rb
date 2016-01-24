class CreateManipulators < ActiveRecord::Migration
  def change
    create_table :manipulators do |t|
      t.string :m_name
      t.string :password
      t.integer :m_type 
      
      t.timestamps null: false
    end
  end
end
