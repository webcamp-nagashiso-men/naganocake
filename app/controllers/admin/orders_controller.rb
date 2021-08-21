class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @order_products = OrderProducts.all
    @end_users = EndUser.all
  end

  def show
    @order_products = @order.order_products
    @order = Order.find(params[:id])
  end


 def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_products = OrderProducts.find(params[:id])
    @order_products.update
    redirect_to admin_order_path(@order.id)
 end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
