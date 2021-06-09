class CartsController < ApplicationController
  
  before_action :setup_cart_item, only: [:add_item, :update_item, :delete_item]
  
  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.new(item_id: params[:item_id])
    end
    @cart_item.count += params[:count].to_i
    if @cart_item.count > 5
      @cart_item.count = 5
    end
    @cart_item.save
    redirect_to current_cart
  end
  
  def update_item
    @cart_item.update(count: params[:count].to_i)
    redirect_to current_cart
  end
  
  def delete_item
    @cart_item.destroy
    redirect_to current_cart
  end
  
  def destroy
    current_cart.destroy
    @cart = Cart.new(customer_id: current_customer.id, status: 0)
    @cart.save
    session[:cart_id] = @cart.id
    flash[:success] = 'カートを削除しました。'
    redirect_to root_url
  end
  
  def show
    @cart = Cart.find(params[:id])
    if @cart.store_id && @cart.cart_items.last
      @store = Store.find(@cart.store_id)
    elsif @cart.store_id
      @cart.store_id = nil
      @cart.save
    elsif @cart.cart_items.last
      @cart.store_id = @cart.cart_items.last.item.store_id
      @cart.save
      @store = Store.find(@cart.store_id)
    end
    @cart_items = current_cart.cart_items.includes([:item])
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def receive
    @cart = Cart.find(params[:id])
    @customer = Customer.find(@cart.customer_id)
    @store = Store.find(@cart.store_id)
  end
  
  def add_receive
    @cart = Cart.find(params[:id])
    @cart.receive = params[:receive]
    @cart.save
    redirect_to "/carts/#{@cart.id}/payment"
  end
  
  def payment
    @cart = Cart.find(params[:id])
  end
  
  def add_payment
    @cart = Cart.find(params[:id])
    @cart.payment = params[:payment]
    @cart.save
    redirect_to "/carts/#{@cart.id}/confirm"
  end
  
  def confirm
    @cart = Cart.find(params[:id])
    @store = Store.find(@cart.store_id)
    @cart_items = @cart.cart_items.includes([:item])
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    if @cart.receive == "delivery"
      @receive = "登録されている住所に配送"
    else
      @receive = "店頭で受け取り"
    end
    if @cart.payment == "credit_card"
      @payment = "クレジットカード"
    else
      @payment = "代金引換"
    end
  end
  
  def complete
    @cart = Cart.find(params[:id])
    @customer = Customer.find(@cart.customer_id)
    @cart.status = 1
    @cart.save
    @cart = Cart.new(customer_id: current_customer.id, status: 0)
    @cart.save
    session[:cart_id] = @cart.id
  end
  
  private
  
  def setup_cart_item
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end
  
end
