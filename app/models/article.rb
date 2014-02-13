class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  validates :title, presence: true
  validates :url, presence: true

  def find_article_points(article)
  	article.votes.where(direction: true).count - article.votes.where(direction: false).count
  end
end
