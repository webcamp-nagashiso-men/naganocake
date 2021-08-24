class Public::ProductsController < ApplicationController
  def top
    @products = Product.all.order(created_at: :desc)
    @genres = Genre.all
	end

	def index
	 # binding.pry
    @genres = Genre.all
      # @products = Product.all.page(params[:page]).per(8)
      # #@products = Product.all.page(params[:page]).per(8)
      # @products = Product.search(params[:word])

    if params[:key_value]=="from_search"  #produts keyword search
      @products = Product.where(['name LIKE ?', "%#{params[:word]}%"]).all.page(params[:page]).per(8)
    elsif params[:search][:value] == "" # if genre null
      @products = Product.all.page(params[:page]).per(8)
      @null="null"
    else # if genre present
      @genre = Genre.find_by(name: params[:search][:value])
      @products =@genre.products.page(params[:page]).per(8)
      # binding.pry
    end
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