class Public::CartProductsController < ApplicationController

  def index
    @cart_products = current_end_user.cart_products
  end

  def update
    @cart_product.update(quantity: params[:quantity].to_i) #to_iで入力した個数を整数に変換
    redirect_to 'cart_products_path'
  end

  def create
    @cart_product = current_end_user.cart_products.new(params_cart_product)
    @update_cart_product = CartProduct.find_by(product: @cart_product.product)
    #カートに入れた商品がカート内商品にあったときは数を足す
    if @update_cart_product.present? #present? 存在すればtrue
      @cart_product.quantity += @update_cart_product.quantity #カートに追加した個数 + カートにある個数 = 合計個数
      @update_cart_product.update(quantity: @cart_product.quantity) #quantitiy(@cart_productのquantity)
    else #false = カートに同じ商品がない時
      @cart_product.save
    end

    redirect_to cart_products_path

  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end

  def all_destroy
    @cart_products = current_end_user.cart_products
    @cart_products.destroy_all
    redirect_to cart_products_path, notice: "削除しました"
  end

  private

  def params_cart_product
    params.require(:cart_product).permit(:product_id, :end_user_id, :quantity)
  end

end