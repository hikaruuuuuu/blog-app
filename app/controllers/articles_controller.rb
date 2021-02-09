class ArticlesController < ApplicationController

  def index
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :price, :hoge)#有料設定(buy_setting)のとこ今はhogeのまま
  end

end
