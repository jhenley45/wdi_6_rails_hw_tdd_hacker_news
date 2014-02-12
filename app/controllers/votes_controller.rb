class VotesController < ApplicationController
	before_action :set_votable

  def create
  	@article = Article.find(params[:article_id])
  	if params[:direction] == "true"
  		#check to see if there's already a "false" vote for this votable
  		if !Vote.find_downvoted_votable(@votable)
  			#no false vote. Check to see if we've already made a true vote
	  		if !Vote.find_upvoted_votable(@votable)
		  		# no true vote. Make one
		  		@vote = @votable.votes.create!(direction: true, user_id: @article.user_id)
		  		flash['alert'] = "Upvote successful"
		  		redirect_to articles_path
	  		else
	  			# already had a true vote
	  			flash['alert'] = "You have already upvoted that article"
	  			redirect_to articles_path
	  		end
	  	else
	  		# False vote exists already. Update "false" vote to "true"
	  		Vote.change_vote_to_true(@votable)
	  		flash['alert'] = "You switched your vote to true"
	  		redirect_to articles_path
	  	end
  	elsif params[:direction] == "false"
  		#Check to see if there's already a "true" vote for this votable
  		if !Vote.find_upvoted_votable(@votable)
  			#no true vote. Make one
	  		if !Vote.find_downvoted_votable(@votable)
	  			@vote = @votable.votes.create!(direction: false, user_id: @article.user_id)
	  			flash['alert'] = "Downvote successful"
	  			redirect_to articles_path
	  		else
	  			flash['alert'] = "You have already downvoted that article"
	  			redirect_to articles_path
	  		end
	  	else
	  		# False vote exists already. Update "false" vote to "true"
	  		Vote.change_vote_to_false(@votable)
	  		flash['alert'] = "You switched your vote to false"
	  		redirect_to articles_path
	  	end
  	else
  		#something went wrong
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
