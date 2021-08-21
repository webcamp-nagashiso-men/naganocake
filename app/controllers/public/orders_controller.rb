class Public::OrdersController < ApplicationController
  
  def new
   @order = Order.new
   
  end

  def check
    @orders = Order.all
    @order = Order.new(order_params)
  end

  def create
    @order = Order.new(order_params)
    @order.save 
  end

  def complete
  end

  def index
   @order = current_end_user.orders
  end

  def show
  end
  
  private
	def order_params
		params.require(:order).permit(:end_user_id, :postage, :total_price, :name, :adddress, :postal_code, :order_status, :payment_method, :addresses)
	end
end
