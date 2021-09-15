class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.find(params[:id])
    @item.save
    redirect_to items_path
  end

  def index
    @items = Item.all
  end

  def show
  end

  def edit
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :price, :introduction, :name)
  end
  
end
