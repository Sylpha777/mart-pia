class CategoriesController < ApplicationController
  
  before_action :store_location
  
  def show
    @category = Category.find(params[:id])
    @store = Store.find(@category.store_id)
    @items = Item.where(category_id: params[:id])
    if customer_logged_in? && @store.id != current_cart.store_id && current_cart.store_id != nil
      flash[:danger] = 'カート内に異なる店舗の商品が入っています。'
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = '新規登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '新規登録に失敗しました。'
      render :new
    end
  end
  
  private

  def category_params
    params.require(:category).permit(:name, :image, :store_id)
  end
  
end
