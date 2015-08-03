# require 'rails_helper'
#
# RSpec.describe "videos/edit", type: :view do
#   before(:each) do
#     @video = assign(:video, Video.create!(
#       :name => "MyString",
#       :description => "MyString",
#       :file => "MyString"
#     ))
#   end
#
#   it "renders the edit video form" do
#     render
#
#     assert_select "form[action=?][method=?]", video_path(@video), "post" do
#
#       assert_select "input#video_name[name=?]", "video[name]"
#
#       assert_select "input#video_description[name=?]", "video[description]"
#
#       assert_select "input#video_file[name=?]", "video[file]"
#     end
#   end
# end
