class CategoriesController < ApplicationController
  
  def show
    @category = Category.find(params[:id])
    @store = Store.find(@category.store_id)
    @items = Item.where(category_id: params[:id])
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
