FactoryGirl.define do
  factory :account do
    sequence(:username) { |n| "User-#{n}"}
    first_name  "John"
    last_name  "Doe"
    password  "12345678"
    password_confirmation  "12345678"
    email { generate :email }
    confirmed_at { 10.seconds.ago }
  end

  sequence :email do |n|
    "person.#{n}@avarteq.de"
  end
end
