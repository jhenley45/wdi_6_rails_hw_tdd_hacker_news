class Vote < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true

	def self.find_upvoted_votable(votable)
		if Vote.where(direction: true, votable_id: votable.id, votable_type: votable.class.name, user_id: votable.user_id).empty?
			false
		else
			true
		end
	end

	def self.find_downvoted_votable(votable)
		if Vote.where(direction: false, votable_id: votable.id, votable_type: votable.class.name, user_id: votable.user_id).empty?
			false
		else
			true
		end
	end

	def self.change_vote_to_true(votable)
		vote = Vote.where(direction: false, votable_id: votable.id, votable_type: votable.class.name, user_id: votable.user_id).first
		vote.update_attributes(direction: true)
	end

	def self.change_vote_to_false(votable)
		vote = Vote.where(direction: true, votable_id: votable.id, votable_type: votable.class.name, user_id: votable.user_id).first
		vote.update_attributes(direction: false)
	end
end
