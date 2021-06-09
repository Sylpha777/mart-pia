module SessionsHelper
  
  def current_customer
    if @current_customer
      return @current_customer
    else
      @current_customer = Customer.find_by(id: session[:customer_id])
      return @current_customer
    end
  end

  def customer_logged_in?
    if current_customer
      return true
    else
      return false
    end
  end
  
  def current_cart
    if @current_cart
      return @current_cart
    else
      @current_cart = Cart.find_by(id: session[:cart_id])
      return @current_cart
    end
  end
  
end
