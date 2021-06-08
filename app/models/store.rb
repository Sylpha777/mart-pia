class Store < ApplicationRecord
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 170 }
  validates :phone, presence: true, length: { maximum: 30 }
  validates :image, presence: true, length: { maximum: 255 }
  validates :business_hours, presence: true, length: { maximum: 200 }
  validates :area, presence: true, length: { maximum: 200 }
  validates :message, presence: true, length: { maximum: 200 }
  
end
