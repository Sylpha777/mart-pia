class Cart < ApplicationRecord
  
  belongs_to :customer
  belongs_to :store, optional: true
  
  has_many :cart_items, dependent: :destroy
  
  enum status: { before_order: 0, before_receive: 1, received: 2 }
  
end
