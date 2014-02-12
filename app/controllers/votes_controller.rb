class VotesController < ApplicationController
	before_action :set_votable

  def create
  	if params[:direction] = true
  		if !Vote.find_upvoted_votable(@votable)
	  		#@comment = @commentable.comments.new(comment_params)
	  		@article = Article.find(params[:article_id])
	  		@vote = @votable.votes.create!(direction: true, user_id: @article.user_id)
	  		flash['alert'] = "Upvote successful"
	  		redirect_to articles_path
  		else
  			flash['alert'] = "You have already upvoted that article"
  			redirect_to articles_path
  		end
  	elsif params[:direction] = false

  	else

  	end
  end

  private

  def set_votable
    @votable = params[:votable].classify.constantize.find(votable_id)
  end

  def votable_id
    params[(params[:votable] + "_id").to_sym]
  end

  # def vote_params
  #   params.require(:vote).permit(:direction)
  # end

end
