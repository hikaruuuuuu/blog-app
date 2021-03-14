class UserDealsController < ApplicationController
  def index
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.create
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.permit.(:f_name, :l_name, :f_name_kana, :l_name_kana, :postal_code, :prefecture_id, :city, :building_number, :building_name, :phone_number)
  end
end
