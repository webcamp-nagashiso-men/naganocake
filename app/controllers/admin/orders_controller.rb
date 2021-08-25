class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).per(10)
    @order_products = OrderProduct.all
    @end_users = EndUser.all
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

 def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
 end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
