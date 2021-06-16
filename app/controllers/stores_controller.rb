class StoresController < ApplicationController
  
  before_action :store_location
  
  def index
    @stores = Store.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @store = Store.find(params[:id])
    @categories = Category.where(store_id: params[:id])
    if customer_logged_in? && @store.id != current_cart.store_id && current_cart.store_id != nil
      flash[:danger] = 'カート内に異なる店舗の商品が入っています。'
    end
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      flash[:success] = '新規登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '新規登録に失敗しました。'
      render :new
    end
  end
  
  private

  def store_params
    params.require(:store).permit(:name, :address, :phone, :image, :business_hours, :area, :message)
  end
  
end
