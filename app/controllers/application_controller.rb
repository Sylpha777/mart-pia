class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private

  def require_customer_logged_in
    unless customer_logged_in?
      redirect_to customers_login_url
    end
  end
  
end
