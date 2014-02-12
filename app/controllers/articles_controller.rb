class ArticlesController < ApplicationController
  def index
  	@articles = Article.order(created_at: :desc)
  end

  def show

  end

  def new
  	@article = Article.new
  end

  def create
  	article = Article.create(article_params)
  	if !(params.has_key?(:name) && params.has_key?(:title))
  		flash['alert'] = "Please try again."
  		redirect_to articles_path
  	elsif article.save
  		redirect_to articles_path
  	else
  		redirect_to root_path
  	end
  end

  private

  def article_params
  	params.require(:article).permit(:user_id, :title, :url, :description)
  end

end
