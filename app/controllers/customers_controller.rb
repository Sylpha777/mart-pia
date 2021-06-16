class CustomersController < ApplicationController
  
  before_action :require_customer_logged_in, only: [:show, :edit, :update]
  before_action :correct_customer, only: [:show, :edit, :update]
  
  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      @cart = Cart.new(customer_id: @customer.id, status: 0)
      @cart.save
      session[:customer_id] = @customer.id
      session[:cart_id] = @cart.id
      NotificationMailer.send_signup_to_customer(@customer).deliver
      flash[:success] = '新規登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '新規登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      NotificationMailer.send_update_to_customer(@customer).deliver
      flash[:success] = '変更しました。'
      redirect_to @customer
    else
      flash.now[:danger] = '変更に失敗しました。'
      render :new
    end
  end
  
  def ordered
    @carts = Cart.where(customer_id: current_customer.id, status: 1 || 2).order(id: :desc).page(params[:page]).per(10)
  end
  
  private

  def customer_params
    params.require(:customer).permit(:name, :address, :phone, :email, :password, :password_confirmation)
  end
  
  def correct_customer
    @customer = Customer.find(params[:id])
    if @customer.id != session[:customer_id]
      redirect_to root_url
    end
  end
  
end
