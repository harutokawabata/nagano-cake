class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    # @order.address = current_customer.postal_code, current_customer.address, current_customer.first_name, current_customer.last_name
      # 上のような表記だと自分にしか配送できないないので記載の必要がない
  end

  def confirm
   @items = Item.all
   @cart_items = current_customer.cart_items
   @order = Order.new(order_params)
   if params[:order][:address_id] == "0" #ご自身の住所を選んだ時（ストロングパラメーターで送られた値は文字列になってしまうため)
    @order.name = current_customer.first_name + current_customer.last_name
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
   elsif params[:order][:address_id] == "1"
    address = Address.find(params[:order][:has_address]) #パラメーターはターミナルかエラー画面で確認する
    @order.name = address.name
    @order.postal_code = address.postal_code
    @order.address = address.address
  # else
    # @order.name = Oder.name
   end
  # @order.payment_method = params[:order][:payment](これはストロングパラメーター使わない時に利用)
  end

  def complete
  end

  def create
    # @cart_item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    @order.save
    cart_items = current_customer.cart_items
    order_detail = OrderDetail.new
    cart_items.each do |cart_item|
      order_detail.order_id = @order.id #親の@orderの
      order_detail.item_id = cart_item.item.id
      order_detail.price = cart_item.item.price
      order_detail.amount = cart_item.amount
      # order_detail.making_status = @order.id
      order_detail.save
    end
    cart_items.delete_all
    redirect_to orders_complete_path
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end

# def confirm
# @order = Order.new
# @cart_items = current_end_user.cart_items
# @order.payment = params[:order][:payment]
# if params[:order][:address_option] == "0"
# @order.postal_code = current_end_user.postal_code
# @order.order_address = current_end_user.address
# elsif params[:order][:address_option] == "1"
# @sta = params[:order][:order_address].to_i
# binding.pry
# @order_address = Address.find(@sta)
# @order.postal_code = @order_address.postal_code
# @order.order_address = @order_address.address
# @order.dear_name = @order_address.dear_name

# elsif params[:order][:address_option] == "2"
# @order.postal_code = params[:order][:postal_code]
# @order.order_address = params[:order][:order_address]
# end

# end

# https://teratail.com/questions/282878