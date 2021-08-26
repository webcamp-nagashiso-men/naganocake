class Public::CartProductsController < ApplicationController

  def index
    @cart_products = current_end_user.cart_products
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(quantity: params[:cart_product][:quantity].to_i) #to_iで入力した個数を整数に変換
    redirect_to cart_products_path, notice: "更新しました"
  end

  def create
    @cart_product = current_end_user.cart_products.new(params_cart_product)
    @update_cart_product = CartProduct.find_by(product: @cart_product.product)
    #カートに入れた商品がカート内商品にあったときは数を足す
    if @update_cart_product.present? && @cart_product.valid? #present? 存在すればtrue
      @cart_product.quantity += @update_cart_product.quantity #カートに追加した個数 + カートにある個数 = 合計個数
      @update_cart_product.update(quantity: @cart_product.quantity) #quantitiy(@cart_productのquantity)
    elsif @cart_product.save #false = カートに同じ商品がない時
      redirect_to cart_products_path, notice: "カートに追加しました"
    else
      @product = Product.find(@cart_product.product_id)#14行目の@carp_productのproduct_idを探してくる
      flash[:alert] = "個数を選択してください"
      render("/public/products/show")
    end


  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path, notice: "削除しました"
  end

  def all_destroy
    @cart_products = current_end_user.cart_products
    @cart_products.destroy_all
    redirect_to cart_products_path, notice: "カートを空にしました"
  end

  private

  def params_cart_product
    params.require(:cart_product).permit(:product_id, :end_user_id, :quantity)
  end

end