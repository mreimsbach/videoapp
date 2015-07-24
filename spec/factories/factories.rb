FactoryGirl.define do
  factory :channel do
    name "MyChannelName"
    description "MyChannelDescription"

    factory :channel_with_courses do
      ignore do
        course_count 2
      end
      after(:build) do |channel, evaluator|
        evaluator.course_count.times do
          channel.courses.build(FactoryGirl.attributes_for(:course))
        end
      end
    end
  end

  factory :course do
    name "AwesomeChannel"
    description "AwesomeChannelDescription"
  end

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
