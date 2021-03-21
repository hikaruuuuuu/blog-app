class UserDealsController < ApplicationController
  def index
    @article = Article.find(params[:article_id])
    @order = Order.new
  end

  def create
    @article = Article.find(params[:article_id])
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      pay_article
      redirect_to article_path(@article)
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:f_name, :l_name, :f_name_kana, :l_name_kana, :postal_code, :prefecture_id, :city, :building_number, :building_name, :phone_number).merge(user_id: current_user.id, article_id: params[:article_id], token: params[:token])
  end

  def pay_article
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @article.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
