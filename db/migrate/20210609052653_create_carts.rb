class CreateCarts < ActiveRecord::Migration[5.2]
  
  def change
    create_table :carts do |t|
      t.references :customer, foreign_key: true
      t.references :store, foreign_key: true
      t.integer :receive
      t.integer :payment
      t.integer :status
      t.integer :number
      t.timestamps
    end
  end
  
end
