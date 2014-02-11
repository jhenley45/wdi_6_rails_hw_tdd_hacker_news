require 'spec_helper'


feature 'User view all articles' do

	background do
		user = create(:user)
		google = create(:article, title: 'Google', url: 'http://www.google.com/some_other_stuff', created_at: '2014-02-11 18:50:45', user: user)
		yahoo = create(:article, title: 'Yahoo', url: 'http://www.yahoo.com/some_other_stuff', created_at: '2014-02-10 18:50:45', user: user)
		barstool = create(:article, title: 'Barstool', url: 'www.barstool.com/some_other_stuff', created_at: '2014-02-09 18:50:45', user: user)
		sign_in_as(user)
	end

	scenario 'sorted by most recent' do
		expect(page).to have_content 'All Articles'
		expect(page).to have_content 'Google'
		expect(page).to have_content 'Yahoo'
		expect(page).to have_content 'Barstool'
		expect(page).to have_content(/Google.*Yahoo.*Barstool/)
	end

	scenario 'showing url of article in parens' do
		expect(page).to have_content '(www.google.com)'
		expect(page).to have_content '(www.yahoo.com)'
		expect(page).to have_content '(www.barstool.com)'
	end

end
