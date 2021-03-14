class UserDealsController < ApplicationController
  def index
    @article = Article.find(params[:article_id])
  end

  def create
    user_deal = UserDeal.create(user_deal_params)
    Address.create(address_params(user_deal))
  end

  private

  def user_deal_params
    params.permit(:article_id).merge(user_id: current_user.id)
  end

  def address_params(user_deal)
    params.permit(:f_name, :l_name, :f_name_kana, :l_name_kana, :postal_code, :prefecture_id, :city, :building_number, :building_name, :phone_number).merge(user_deal_id: user_deal.id)
  end
end
