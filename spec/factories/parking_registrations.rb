# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :parking_registration do
    first_name "John"
    last_name "Doe"
    email "john@example.com"
    spot_number 5
    parked_on "2013-09-21"
  end
end
