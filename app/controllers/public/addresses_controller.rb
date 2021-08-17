class Public::AddressesController < ApplicationController
  def index
    @addresses = Addresse.all
  end

  def create
    @addresse = Addresse.new(addresse_params)
    addresse.save
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:addresse).permit(:postal_code, :addresse, :name)
  end
end
