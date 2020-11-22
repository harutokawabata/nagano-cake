class Admin::ItemsController < ApplicationController
 before_action :authenticate_admin!

  def index
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @genre = Genre.id
    @item.save
    redirect_to admin_item_path
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.name
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path
    else
      flash[:natice] = 'error'
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image_id, :introduction, :price, :is_active)
  end
end
