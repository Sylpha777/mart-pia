class CreateCategories < ActiveRecord::Migration[5.2]
  
  def change
    create_table :categories do |t|
      t.references :store, foreign_key: true
      t.string :name
      t.string :image
      t.timestamps
    end
  end
  
end
