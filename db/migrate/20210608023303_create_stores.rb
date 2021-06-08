class CreateStores < ActiveRecord::Migration[5.2]
  
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :image
      t.string :business_hours
      t.string :area
      t.string :message
      t.timestamps
    end
  end
  
end
