class CustomersController < ApplicationController
  
  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
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
  end
  
  private

  def customer_params
    params.require(:customer).permit(:name, :address, :phone, :email, :password, :password_confirmation)
  end
  
end
