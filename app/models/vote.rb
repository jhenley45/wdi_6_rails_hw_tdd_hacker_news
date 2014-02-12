class Vote < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true

	def self.find_upvoted_votable(votable)
		if Vote.where(direction: true, votable_id: votable.id, votable_type: votable.class.name, user_id: votable.user_id).empty?
			false
		else
			true
		end
	end
end
