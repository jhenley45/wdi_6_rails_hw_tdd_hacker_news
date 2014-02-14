require 'spec_helper'


feature 'User view all articles' do

	background do
		user = create(:user)
		google = create(:article, title: 'Google', url: 'http://www.google.com/intl/en/about/', created_at: '2014-02-11 18:50:45', user: user)
		yahoo = create(:article, title: 'Yahoo', url: 'http://news.yahoo.com/', created_at: '2014-02-10 18:50:45', user: user)
		barstool = create(:article, title: 'Reddit', url: 'www.reddit.com/r/funny/', created_at: '2014-02-09 18:50:45', user: user)
		sign_in_as(user)
	end

	# scenario 'sorted by upvotes' do
	# 	visit articles_path
	# 	expect(page).to have_content 'Jacker News'
	# 	expect(page).to have_content 'Google'
	# 	expect(page).to have_content 'Yahoo'
	# 	expect(page).to have_content 'Reddit'
	# 	expect(page).to have_content(/Google.*Yahoo.*Reddit/)
	# end

	scenario 'showing url of article in parens' do
		expect(page).to have_content '(www.google.com)'
		expect(page).to have_content '(news.yahoo.com)'
		expect(page).to have_content '(www.reddit.com)'
	end



end
