class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end

  def check
    
  end

  def create
  end

  def complete
  end

  def index
   @order = current_end_user.orders
  end

  def show
  end
  
  private
	def product_params
		parmas.require(:order).permit(:end_user_id, :postage, :total_price, :name, :adddress, :postal_code, :order_status, :payment_method)
	end
end
