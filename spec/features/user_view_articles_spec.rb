require 'spec_helper'


feature 'User view all articles' do

	scenario 'sorted by most recent' do
		user = create(:user)
		google = create(:article, title: 'Google', created_at: '2014-02-11 18:50:45', user: user)
		yahoo = create(:article, title: 'Yahoo', created_at: '2014-02-10 18:50:45', user: user)
		barstool = create(:article, title: 'Barstool', created_at: '2014-02-09 18:50:45', user: user)
		sign_in_as(user)

		expect(page).to have_content 'All Articles'
		expect(page).to have_content 'Google'
		expect(page).to have_content 'Yahoo'
		expect(page).to have_content 'Barstool'

		expect(page).to have_content(/Google.*Yahoo.*Barstool/)

	end

end
