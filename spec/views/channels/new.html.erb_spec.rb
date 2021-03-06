require 'rails_helper'

RSpec.describe "channels/new", type: :view do
  before(:each) do
    assign(:channel, Channel.new(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new channel form" do
    render

    assert_select "form[action=?][method=?]", channels_path, "post" do

      assert_select "input#channel_name[name=?]", "channel[name]"

      assert_select "textarea#channel_description[name=?]", "channel[description]"
    end
  end
end
