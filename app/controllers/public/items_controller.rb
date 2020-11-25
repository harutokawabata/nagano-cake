class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
    @cart_items = CartItem.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all

  end

  private
  def item_params
    params.require(:item).parmit(:name, :image, :introduction, :price, :is_active, :genre_id)
  end
  def cart_item_params
    params.require(:cart_item).parmit(:amount)
  end

end
