class CommentsController < ApplicationController
	before_action :get_article


  def index
  	@comment = Comment.new
  	@comments = @article.comments.includes(:user)
    @comments.sort_by! { |article| (article.votes.where(direction: true).count - article.votes.where(direction: false).count) }.reverse!
  	@vote = Vote.new
  end

  def show

  end

  def new
  end

  def create
  	@comment = @article.comments.new(comment_params)
  	@comment.assign_attributes(user: current_user)
  	if @comment.save
  		redirect_to [@article, :comments]
  	else
  		redirect_to root_path
  	end
  end

  private

  def comment_params
  	params.require(:comment).permit(:content)
  end

  def get_article
  	@article = Article.find(params[:article_id])
  end
end
