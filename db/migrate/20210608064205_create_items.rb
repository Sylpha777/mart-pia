class CreateItems < ActiveRecord::Migration[5.2]
  
  def change
    create_table :items do |t|
      t.references :store, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name
      t.string :image
      t.integer :price
      t.integer :stock, default: 0
      t.string :message
      t.timestamps
    end
  end
  
end
