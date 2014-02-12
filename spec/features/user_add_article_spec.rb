require 'spec_helper'

feature 'User add an article ' do

	background do
		user = create(:user)
		sign_in_as(user)
		click_link 'Submit'
	end

	scenario 'successfully' do
		fill_in 'Title', with: 'Weather'
		fill_in 'Url', with: 'http://www.weather.com'
		fill_in 'Description', with: 'This is the goddamn weather channel!'
		click_button 'Submit Article'

		expect(page).to have_content 'Weather'
	end

	scenario 'unsuccessfully with blank fields' do
		click_button 'Submit Article'
		expect(page).to have_content 'Please try again.'
	end
end
