class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
    @article = Article.find(params[:id])
    post_user = @article.user
    @user_articles = @article.not_selected_articles(post_user)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.new(article_params)
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

end
