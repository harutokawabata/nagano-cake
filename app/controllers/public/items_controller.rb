class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
    @cart_items = CartItem.all
    # @cart_items.destroy_all
    # redirect_to cart_item_path
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
    @genres = Genre.all

  end

  # private
  # (必要ない)
  # def item_params
  #   params.require(:item).parmit(:name, :image, :introduction, :price, :is_active, :genre_id)
  # end
  # def cart_item_params
  #   params.require(:cart_item).parmit(:amount)
  # end

end
