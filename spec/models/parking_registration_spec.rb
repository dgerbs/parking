require 'spec_helper'

describe ParkingRegistration do
  it { should have_valid(:email).when('john@example.com', 'user+2@another.com') }

	it { should_not have_valid(:email).when(nil, '', 'foo') }

	it { should have_valid(:first_name).when('John', 'Dave') }

	it { should_not have_valid(:first_name).when(nil, '') }

	it { should have_valid(:last_name).when('Doe', 'Smith') }

	it { should_not have_valid(:last_name).when(nil, '') }

	it { should have_valid(:spot_number).when(5, 20) }

	it { should_not have_valid(:spot_number).when(nil, 0, 61) }

	it { should have_valid(:parked_on).when(Date.today) }

	it { should_not have_valid(:parked_on).when(nil, '') }

	describe 'parking' do
		it 'parks the car for today' do
			registration = FactoryGirl.build(:parking_registration, parked_on: nil)
			expect(registration.park).to eql(true)
			expect(registration.parked_on).to eql(Date.today)
		end
	end
end
