class ItemsController < ApplicationController
  
  def show
    @item = Item.find(params[:id])
    @store = Store.find(@item.store_id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = '新規登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '新規登録に失敗しました。'
      render :new
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :message, :store_id, :category_id)
  end
  
end
