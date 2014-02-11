require 'spec_helper'

describe User do

	it 'is invalid without an email' do
		expect(User.create(about: 'Hey yo its your boy')).to_not be_valid
	end

	describe 'associations' do
		it { should have_many :articles }
	end

	describe 'associations' do
		it { should have_many :comments }
	end
end
