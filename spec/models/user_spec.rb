require 'spec_helper'

describe User do

	it 'is invalid without an email' do
		expect(User.create(username: 'jhenley45', about: 'Hey yo its your boy')).to_not be_valid
	end

end
