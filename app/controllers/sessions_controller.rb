class SessionsController < ApplicationController
  
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if customer_login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_back
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    session[:customer_id] = nil
    session[:return_to] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private

  def customer_login(email, password)
    @customer = Customer.find_by(email: email)
    if @customer && @customer.authenticate(password)
      session[:customer_id] = @customer.id
      session[:cart_id] = Cart.where(customer_id: @customer.id, status: 0).last.id
      return true
    else
      return false
    end
  end
  
  def redirect_back
    if session[:return_to]
      redirect_to session[:return_to]
    else
      redirect_to root_url
    end
  end
  
end
