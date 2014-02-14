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
  end

  private

  def set_votable
    @votable = params[:votable].classify.constantize.find(votable_id)
  end

  def votable_id
    params[(params[:votable] + "_id").to_sym]
  end

end
