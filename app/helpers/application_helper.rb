module ApplicationHelper
	def find_article_points(article)
  	article = Article.find(article.id)
  	article.votes.where(direction: true).count - article.votes.where(direction: false).count
  end
	def find_comment_points(comment)
  	comment = Comment.find(comment.id)
  	comment.votes.where(direction: true).count - comment.votes.where(direction: false).count
  end
end
