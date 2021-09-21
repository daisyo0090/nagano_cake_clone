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
    @items = Item.all.page(params[:page]).per(10)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @itemgenre = Item.genre
  end

  def edit
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :price, :introduction, :name)
  end
  
end
