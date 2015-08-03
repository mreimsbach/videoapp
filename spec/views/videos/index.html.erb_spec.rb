# require 'rails_helper'
#
# RSpec.describe "videos/index", type: :view do
#   before(:each) do
#     assign(:videos, [
#       Video.create!(
#         :name => "Name",
#         :description => "Description",
#         :file => "File"
#       ),
#       Video.create!(
#         :name => "Name",
#         :description => "Description",
#         :file => "File"
#       )
#     ])
#   end
#
#   it "renders a list of videos" do
#     render
#     assert_select "tr>td", :text => "Name".to_s, :count => 2
#     assert_select "tr>td", :text => "Description".to_s, :count => 2
#     assert_select "tr>td", :text => "File".to_s, :count => 2
#   end
# end
