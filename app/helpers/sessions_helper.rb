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
  
end
