class ParkingRegistration < ActiveRecord::Base
	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :email
	validates_presence_of :spot_number
	validates_presence_of :parked_on

	validates_format_of :email,
	with: /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i

	validates_numericality_of :spot_number,
		only_integer: true,
		greater_than_or_equal_to: 1,
		less_than_or_equal_to: 60

	def park
		self.parked_on = Date.today
		save
	end	

	def neighbors
		[
			ParkingRegistration.where({
				spot_number: self.spot_number - 1,
				parked_on: self.parked_on
			}).first,
			ParkingRegistration.where({
				spot_number: self.spot_number + 1,
				parked_on: self.parked_on
			}).first
		]
	end
end
