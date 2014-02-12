require 'spec_helper'


feature 'Users can upvote articles' do


	background do
		user = create(:user)
		sign_in_as(user)
		google = create(:article, title: 'Google', url: 'http://www.google.com/intl/en/about/', created_at: '2014-02-11 18:50:45', user: user)
	end

	scenario 'successfully' do
		visit articles_path
		click_link 'upvote'
		expect(page).to have_content 'Upvote successful'
	end
end
