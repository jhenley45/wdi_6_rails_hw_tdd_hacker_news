class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_many :votes, as: :votable

  validates :user_id, presence: true
  validates :article_id, presence: true
end
