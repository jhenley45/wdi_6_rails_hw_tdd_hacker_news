class ArticlesController < ApplicationController
  def index
    #@articles = Article.includes(:votes).order("votes.true.count")
    #@articles = Article.all.sort! { |x,y| x.votes.count <=> y.votes.count }
    @articles = Article.all
    @articles.sort_by! { |article| (article.votes.where(direction: true).count - article.votes.where(direction: false).count) }.reverse!
  	#binding.pry
    #@articles = Article.order(created_at: :desc)
    @vote = Vote.new
  end

  def show

  end

  def new
  	@article = Article.new
  end

  def create
  	if (article_params[:url].empty? or article_params[:title].empty?)
     	flash['alert'] = "Please try again."
  	 	redirect_to articles_path
  	else
      article = Article.create!(article_params)
  		redirect_to articles_path
  	end
  end

  private

  def article_params
  	params.require(:article).permit(:user_id, :title, :url, :description)
  end

end
