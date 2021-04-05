class UserDealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:index, :create] 

  def index
    @order = Order.new
    redirect_to article_path(@article) if current_user == @article.user || current_user.user_deals.where(article_id: @article.id).length != 0
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      pay_article
      @sold_status = current_user.user_deals.where(article_id: @article.id).present?
      redirect_to article_path(@article)
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:f_name, :l_name, :f_name_kana, :l_name_kana, :postal_code, :prefecture_id, :city, :building_number, :building_name, :phone_number).merge(user_id: current_user.id, article_id: params[:article_id], token: params[:token])
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def pay_article
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    Payjp::Charge.create(
      amount: @article.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
