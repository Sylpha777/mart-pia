class Cart < ApplicationRecord
  
  belongs_to :customer
  belongs_to :store, optional: true
  
  has_many :cart_items, dependent: :destroy
  
  enum status: { 注文前: 0, 注文済み: 1, 受け取り済み: 2 }
  
  enum receive: { 登録されている住所に配送: 0, 店舗で受け取る: 1 }
  enum payment: { クレジットカード: 0, 代金引換: 1 }
  
end
