class Customer < ApplicationRecord
  
  validates :name, presence: true, length: { maximum: 60 }
  validates :address, presence: true, length: { maximum: 170 }
  validates :phone, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  
  has_secure_password
  
end
