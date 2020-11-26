class Public::CartItemsController < ApplicationController

  def index
    # @cart_item = Cart_item.new
    @cart_items = current_customer.cart_items
    # ログイン中のユーザーの持っているcartitemだけ表示
    # @cart_item = CartItem.find(params[:id])
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    # @item = Item.find(params[:id])
    # @cart_item.item_id = @item.id
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    # @cart_item.item_id = @item.id
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
    # permitで:amount, :item_idを定義していますがcreateで使うのはcustmoer_idも入るのでこれはアクションないで別途定義必要
  end
end
