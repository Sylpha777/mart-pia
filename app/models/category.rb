class Category < ApplicationRecord
  
  belongs_to :store
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :image, presence: true, length: { maximum: 255 }
  
  has_many :items
  
end
