class Item < ApplicationRecord
  
  belongs_to :store
  belongs_to :category
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :image, presence: true, length: { maximum: 255 }
  validates :price, presence: true, length: { maximum: 10 }
  validates :stock, presence: true, length: { maximum: 10 }
  validates :message, presence: true, length: { maximum: 200 }
  
end
