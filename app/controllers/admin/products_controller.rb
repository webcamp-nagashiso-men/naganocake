class Admin::ProductsController < ApplicationController

  def new
    @product = Product.new
  end
  
  def index
    @products = Product.all
  end
  
  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_products_path
  end
  
  def show
    # @product = Product.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  private
  def product_params
    params.require(:product).permit(:genre_id, :name, :price, :guide, :image_id, :is_active)
  end
  
end
