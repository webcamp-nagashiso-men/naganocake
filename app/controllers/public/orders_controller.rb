class Public::OrdersController < ApplicationController

  def new
   @order = Order.new
   @orders = Order.all
   @shipping_addresses = ShippingAddress.where(end_user: current_end_user)
  end

  def check
    @orders = Order.all
    @order = Order.new
    @order.postage = 800
    if params[:order][:addresses] == "0"
      @order.postal_code = current_end_user.postal_code
      @order.address = current_end_user.address
      @order.name = current_end_user.name_last + current_end_user.name_first
    elsif params[:order][:addresses] == "1"
      @address = ShippingAddress.find(params[:order][:id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else params[:order][:addresses] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end

    @cart_products = current_end_user.cart_products
  end

  def create
    @cart_products = current_end_user.cart_products

    @order = Order.new(order_params)
    @order.save
    redirect_to orders_complete_path

    @cart_products.each do |cart_product|
      OrderProduct.create(
        product_id: cart_product.product.id,
        order_id: @order.id,
        quantity: cart_product.quantity,
        purchase_price: cart_product.product.price,

        )
    end

    @cart_products.destroy_all
  end

  def complete
  end

  def index
   @order = Order.all
   @orders = current_end_user.orders
  end

  def show
   @order = Order.find(params[:id])
   @order_products = @order.order_products

  end

  private
	def order_params
		params.require(:order).permit(:end_user_id, :postage, :total_price, :name, :address, :postal_code, :order_status, :payment_method, :addresses)
	end
end
