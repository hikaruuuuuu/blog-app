class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update]
  before_action :move_index, only: [:edit, :update]

  def index
    @articles = Article.includes(:user).created_at_desc_sort
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    post_user = @article.user
    @user_articles = @article.not_selected_articles(post_user)
    @sold_status = current_user.user_deals.where(article_id: @article.id).present?
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :price, :image, :buy_setting).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def move_index
    redirect_to root_path if @article.user != current_user
  end

end
