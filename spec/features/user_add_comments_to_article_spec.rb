require 'spec_helper'

feature 'User can add comments to an article ' do

	background do
		user = create(:user)
		sign_in_as(user)
		google = create(:article, title: 'Google', url: 'http://www.google.com/intl/en/about/', created_at: '2014-02-11 18:50:45', user: user)
		visit articles_path
		click_link 'comment'
	end

	scenario 'successfully' do
		fill_in 'Comment', with: 'This is a comment about Google.'
		click_button 'Submit Comment'
		expect(page).to have_content 'This is a comment about Google.'
	end
end
