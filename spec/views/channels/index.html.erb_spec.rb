require 'rails_helper'

RSpec.describe "channels/index", type: :view do
  before(:each) do
    assign(:channels, [
      Channel.create!(
        :name => "Name",
        :description => "Description"
      ),
      Channel.create!(
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  # it "renders a list of channels" do
  #   render
  #   assert_select "tr>td", :text => "Name".to_s, :count => 2
  #   assert_select "tr>td", :text => "Description".to_s, :count => 2
  # end
end
