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
      flash[:success] = '変更しました。'
      redirect_to @customer
    else
      flash.now[:danger] = '変更に失敗しました。'
      render :new
    end
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
