require 'spec_helper'

describe Comment do

	it 'is invalid without a user_id' do
		expect(Comment.create(article_id: 5)).to_not be_valid
	end
	it 'is invalid without an article_id' do
		expect(Comment.create(user_id: 5)).to_not be_valid
	end
end
