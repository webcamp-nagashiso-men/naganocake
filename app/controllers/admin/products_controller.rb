class Admin::ProductsController < ApplicationController
  # before_action :authenticate_admin!,only: [:create, :edit, :update, :index, :show, :new]
  
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
      flash[:notice] = "登録完了"
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
    if @product.update(product_params)
      flash[:notice] = "変更完了"
      redirect_to admin_products_path
    else
      render :edit
    end  
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end 

  private
  def product_params
    params.require(:product).permit(:genre_id, :name, :price, :guide, :image, :is_active, :genre)
  end

end
