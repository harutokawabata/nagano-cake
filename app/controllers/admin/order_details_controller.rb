class Admin::OrderDetailsController < ApplicationController

def index
end

def show
  @order = Order.find(params[:id])
  @order_details = @order.order_details
      # @cart_items = current_customer.cart_items
      # @order_detail

end

def update
  # @order_details = OrderDetail.all
  @order_detail = OrderDetail.find(params[:id])
  @order = @order_detail.order
  @order_detail.update(order_detail_params)
  if @order_detail.making_status == "making"
     @order.update(status: "making")
  end
  if @order.order_details.count == OrderDetail.where(order_id: @order.id).where(making_status: "finish").count
    #@order.order_detailsと同じ
     @order.update(status: "perparation")
  end
  redirect_back(fallback_location: admin_orders_path)
  # redirect_to admin_order_path
end

private
  def order_detail_params
  params.require(:order_detail).permit(:making_status)
  end
end
