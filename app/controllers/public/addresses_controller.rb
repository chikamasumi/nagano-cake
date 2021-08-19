class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    address.save
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
