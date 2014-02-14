require 'spec_helper'


feature 'Users can upvote article comments' do


	background do
		user = create(:user)
		sign_in_as(user)
		google = create(:article, title: 'Google', url: 'http://www.google.com/intl/en/about/', created_at: '2014-02-11 18:50:45', user: user)
		visit articles_path
		click_link 'comments'
		fill_in 'Comment', with: 'This is a comment about Google.'
		click_button 'Submit Comment'
	end

	scenario 'successfully' do
		click_link 'upvote'
		expect(page).to have_content '1 points'
	end

	scenario 'unsuccessfully' do
		click_link 'upvote'
		expect(page).to have_content '1 points'
		click_link 'upvote'
		expect(page).to have_content '1 points'
	end

end
