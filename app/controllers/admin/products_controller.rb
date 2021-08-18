class Admin::ProductsController < ApplicationController

  def new
    @product = Product.new
  end
  
  def index
    @product = Product.all
  end
  
  def create
    product = Product.new(product_params)
    product.save
    redirect_to admin_product_path
  end
  
  def show
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
