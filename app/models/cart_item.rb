class CartItem < ApplicationRecord
  
  belongs_to :cart
  belongs_to :item
  
  def sum_of_price
    item.price * count
  end
  
end
