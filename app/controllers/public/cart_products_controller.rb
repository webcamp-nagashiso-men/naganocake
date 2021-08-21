class Public::CartProductsController < ApplicationController

  def index
    @cart_products = current_end_user.cart_products
  end

  def update
    @cart_product.update(quantity: params[:quantity].to_i) #to_iで個数を整数に変換
    redirect_to 'cart_products_path'
  end

  def create
    @cart_product = current_end_user.cart_products.new(params_cart_product)
    @update_cart_product = CartProduct.find_by(product: @cart_product.product)
    if @update_cart_product.present? && @cart_product.valid?
      @cart_product.quantity += @update_cart_product.quantity
      @update_cart_product.destroy
    end
  end

  def destroy
    @cart_product.destroy
    redirect_to 'cart_products_path'
  end

  def all_destroy
  end

  private

  def params_cart_product
    params.require(:cart_product).permit(:product_id, :end_user_id, :quantity)
  end

end
