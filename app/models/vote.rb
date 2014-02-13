class Vote < ActiveRecord::Base
	belongs_to :votable, polymorphic: true
	validates :user_id, :uniqueness => {scope: [:votable_type, :votable_id, :direction] }, presence: true




	# def self.find_upvoted_votable(votable, user)
	# 	if Vote.where(direction: true, votable_id: votable.id, votable_type: votable.class.name, user_id: user.id).empty?
	# 		false
	# 	else
	# 		true
	# 	end
	# end

	# def self.find_downvoted_votable(votable, user)
	# 	if Vote.where(direction: false, votable_id: votable.id, votable_type: votable.class.name, user_id: user.id).empty?
	# 		false
	# 	else
	# 		true
	# 	end
	# end

	# def self.change_vote_to_true(votable, user)
	# 	vote = Vote.where(direction: false, votable_id: votable.id, votable_type: votable.class.name, user_id: user.id).first
	# 	vote.update_attributes(direction: true)
	# end

	# def self.change_vote_to_false(votable, user)
	# 	vote = Vote.where(direction: true, votable_id: votable.id, votable_type: votable.class.name, user_id: user.id).first
	# 	vote.update_attributes(direction: false)
	# end
end
