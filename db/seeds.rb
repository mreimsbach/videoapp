# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
sven = FactoryGirl.create(:user, email: "sschmidt@avarteq.de", username: "sven")

99.times do |n|
  FactoryGirl.create(:user, username: FFaker::Name.name)
end

5.times do
  sven.channel.courses.build(FactoryGirl.attributes_for(:course)).save
end

first_course = Channel.first.courses.first
FactoryGirl.create(:video_with_comments, course: first_course, user: Channel.first.user)
