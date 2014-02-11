FactoryGirl.define do

	factory :user do
		email 'jack@example.com'
		password 'password1'
	end

	factory :article do
		title 'Google'
		url 'http://www.google.com'
		description 'This is google'
		created_at '2014-02-11 18:50:45'
		user
	end

end
