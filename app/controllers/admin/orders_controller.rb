class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!

  def index
    # @order = Order.new(order_params)
    # @order.save
    @order_details = OrderDetail.all
    # @cart_items = current_customer.cart_items
    # @order_detail = OrderDetail.new
    # @cart_items.each do |cart_item|
    #   order_detail.created_at = @order.created_at #親の@orderの
    #   order_detail.name = cart_item.customer.name
    #   order_detail.amount = cart_item.item.amount
    #   order_detail.status
    #   # order_detail.making_status = @order.id
    #   order_detail.save
    # end
    if params[:day]
    @orders = Order.created_today
    else
      @order = Order.all
    end
  end

  def show
    # @order_details = @order.order_details
    @order = Order.new(order_params)
    @order_details = OrderDetail.all
      # @cart_items = current_customer.cart_items
    @order_detail = OrderDetail.new

      # 確認画面の内容（商品の一覧）＝ユーザーが購入する商品
      # 確認画面に表示されている商品　＝　ユーザーがカートに入れている商品
      # ユーザーは買いたい商品はカートに入っている商品　⇨　購入することでorder_detailにも登録されるように
      # cartの中身を見れば何を購入したいかがわかる
  end

  def update
    @order_details = OrderDetail.all
    @order.save
  end

  private
  def order_params
    params.permit(:payment_method, :customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment,  :status)
    # (:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment,  :status)
  end

end

