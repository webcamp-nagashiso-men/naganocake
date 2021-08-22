class Admin::ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
    @products = Product.all.page(params[:page]).per(10)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end  
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit(:genre_id, :name, :price, :guide, :image, :is_active, :genre)
  end

end
