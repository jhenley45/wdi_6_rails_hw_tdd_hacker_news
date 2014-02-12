class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  validates :title, presence: true
  validates :url, presence: true
end
