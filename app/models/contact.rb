class Contact < ApplicationRecord
  
  validates :name, presence: true, length: { maximum: 60 }
  validates :phone, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :message, presence: true, length: { maximum: 200 }
  
end
