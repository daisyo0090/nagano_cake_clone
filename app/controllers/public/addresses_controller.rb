class Public::AddressesController < ApplicationController

  def index
      @address = Address.new
      @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
