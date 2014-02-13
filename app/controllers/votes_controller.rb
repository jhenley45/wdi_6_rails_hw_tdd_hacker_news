class VotesController < ApplicationController
	before_action :set_votable

  def create
  	if current_user.votes.where(votable_id: @votable.id, votable_type: @votable.class.name).present?
  		@vote = current_user.votes.find_by(votable_id: @votable.id, votable_type: @votable.class.name)
  	else
  		@vote = @votable.votes.new(user_id: current_user.id)
  	end
  	@vote.direction = params[:direction]
  	@vote.save
  	redirect_to :back
  	# if @votable.votes.new(direction: params[:direction], user_id: current_user.id)
  	# #@article = Article.find(params[:article_id])
  	# if params[:direction] == "true"
  	# 	@vote = @votable.votes.new(direction: true, user_id: current_user.id)
  	# 	if @vote.save
  	# 		flash['alert'] = "Upvote successful"
  	# 		redirect_to :back
  	# 	else
  	# 		flash['alert'] = "You have already upvoted this"
  	# 		redirect_to :back
  	# 	end
  	# 	# #check to see if there's already a "false" vote for this votable
  	# 	# if !Vote.find_downvoted_votable(@votable, current_user)
  	# 	# 	#no false vote. Check to see if we've already made a true vote
	  # 	# 	if !Vote.find_upvoted_votable(@votable, current_user)
		 #  # 		# no true vote. Make one
		 #  # 		@vote = @votable.votes.create!(direction: true, user_id: current_user.id)
		 #  # 		flash['alert'] = "Upvote successful"
		 #  # 		redirect_to :back
	  # 	# 	else
	  # 	# 		# already had a true vote
	  # 	# 		flash['alert'] = "You have already upvoted this"
	  # 	# 		redirect_to :back
	  # 	# 	end
	  # 	# else
	  # 	# 	# False vote exists already. Update "false" vote to "true"
	  # 	# 	Vote.change_vote_to_true(@votable, current_user)
	  # 	# 	flash['alert'] = "You switched your vote to true"
	  # 	# 	redirect_to :back
	  # 	# end
  	# elsif params[:direction] == "false"
  	# 	@vote = @votable.votes.new(direction: false, user_id: current_user.id)
  	# 	if @vote.save
  	# 		flash['alert'] = "Downvote successful"
  	# 		redirect_to :back
  	# 	else
  	# 		flash['alert'] = "You have already downvoted this"
  	# 		redirect_to :back
  	# 	end
  	# 	# #Check to see if there's already a "true" vote for this votable
  	# 	# if !Vote.find_upvoted_votable(@votable, current_user)
  	# 	# 	#no true vote. Make one
	  # 	# 	if !Vote.find_downvoted_votable(@votable, current_user)
	  # 	# 		@vote = @votable.votes.create!(direction: false, user_id: current_user.id)
	  # 	# 		flash['alert'] = "Downvote successful"
	  # 	# 		redirect_to :back
	  # 	# 	else
	  # 	# 		flash['alert'] = "You have already downvoted this"
	  # 	# 		redirect_to :back
	  # 	# 	end
	  # 	# else
	  # 	# 	# False vote exists already. Update "false" vote to "true"
	  # 	# 	Vote.change_vote_to_false(@votable, current_user)
	  # 	# 	flash['alert'] = "You switched your vote to false"
	  # 	# 	redirect_to :back
	  # 	# end
  	# else
  	# 	# something went terribly wrong
  	# end
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
