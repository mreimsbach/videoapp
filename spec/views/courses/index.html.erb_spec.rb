require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  # before(:each) do
  #   assign(:courses, [
  #     create(:course),
  #     create(:course)
  #   ])
  # end

  it "renders a list of courses" do
    @channel = create(:channel)
    render(channel_id: @channel.id)
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
