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
  @order_detail = Order_detail.find(params[:id])
  @order_detail.update
  redirect_back(fallback_location: admin_orders_path)
  # redirect_to admin_order_path
end

private
  def order_params
  params.require(:order_detail).permit(:making_status)
  end
end
