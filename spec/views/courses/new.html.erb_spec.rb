# require 'rails_helper'
#
# RSpec.describe "courses/new", type: :view do
#   before(:each) do
#     assign(:course, Course.new(
#       :name => "MyString",
#       :description => "MyString"
#     ))
#   end
#
#   it "renders new course form" do
#     render
#
#     assert_select "form[action=?][method=?]", courses_path, "post" do
#
#       assert_select "input#course_name[name=?]", "course[name]"
#
#       assert_select "input#course_description[name=?]", "course[description]"
#     end
#   end
# end
