class Public::ProductsController < ApplicationController
    def top
      @products = Product.all.order(created_at: :desc)
      @genres = Genre.all
	end

	def index
      @genres = Genre.all
      @products = Product.where(is_active: true).page(params[:page]).per(8)
	end

	def show
      @products = Product.all
      @product = Product.find(params[:id])
      @cart_product = CartProduct.new
	end

	private

	def product_params
	  parmas.require(:product).permit(:image_id, :name, :price, :guide, :is_active)
	end
end