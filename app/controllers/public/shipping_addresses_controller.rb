class Public::ShippingAddressesController < ApplicationController
  
  def index
    @shipping_addresses = current_end_user.shipping_addresses
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.end_user_id = current_end_user.id
    @shipping_address.save
    redirect_to shipping_addresses_path, notice: '新しい住所が作成されました'
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_to shipping_addresses_path

  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.update(shipping_address_params)
    redirect_to shipping_addresses_path
  end
  
  private
  def shipping_address_params
    params.require(:shipping_address).permit(:postal_code, :address, :name)
  end
  
end
