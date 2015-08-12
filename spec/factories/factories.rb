require 'ffaker'
FactoryGirl.define do
  factory :channel do
    name "MyChannelName"
    description "MyChannelDescription"

    factory :channel_with_courses do
      transient do
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
    name "AwesomeCourse"
    description "AwesomeCourseDescription"

    association :channel, factory: :channel

  end

  factory :user do
    sequence(:username) { |n| "User-#{n}"}
    admin false
    password  "12345678"
    password_confirmation  "12345678"
    email  { "#{rand(100000)}_#{FFaker::Internet.email}" }
    #confirmed_at { 10.seconds.ago }
    confirmed_at Date.today
  end


  factory :video do
    name "Awesome Video"
    description "Too many cooks"
    file  Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/test.mp4')))
    user { create(:user) }

    factory :video_with_comments do
      transient do
        comments 100
      end
      after(:build) do |video, evaluator|
        users = User.all
        evaluator.comments.times do
          video.comments.build(attributes_for(:comment, user_id: users.sample._id))
        end
      end
    end
  end

  factory :comment do
    text FFaker::BaconIpsum.sentence
    user_id { create(:user)._id }
    association :video, factory: :video
  end

end
