class Admin::OrderProductsController < ApplicationController

    def update
    @order_product = OrderProduct.find(params[:id])
    @order = @order_product.order
    @order_product.update(order_product_params)
    if params[:order_product][:make_status] == "製作中"
      @order.update(order_status: "製作中")
    end
    if @order.order_products.all?{ |order_product| order_product.make_status == "製作完了"}
      @order.update(order_status: "発送準備中")
    end
     redirect_to admin_order_path(@order_product.order_id)
   end

  def order_product_params
    params.require(:order_product).permit(:make_status)
  end

end
