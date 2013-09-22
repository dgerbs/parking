module ParkingRegistrationTestHelpers
	def create_registration_for(spot_number)
		visit '/'
		fill_in 'First name', with: 'John'
		fill_in 'Last name', with: 'Doe'
		fill_in 'Email', with: 'john@example.com'
		fill_in 'Spot number', with: spot_number
		click_button 'Register'
	end
end