require 'spec_helper'

describe User do

	it 'is invalid without an email' do
		expect(User.create(username: 'jhenley45', about: 'Hey yo its your boy')).to_not be_valid
	end

	it 'is invalid without a username' do
		expect(User.create(email: 'jack@aol.com', about: 'Hey yo its your boy')).to_not be_valid
	end

	describe 'associations' do
		it { should have_many :articles }
	end

end
