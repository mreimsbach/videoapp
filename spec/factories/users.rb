FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "User-#{n}"}
    admin false
    password  "12345678"
    password_confirmation  "12345678"
    email { generate :email }
    #confirmed_at { 10.seconds.ago }
  end

  sequence :email do |n|
    "person.#{n}@avarteq.de"
  end
end
