require 'rails_helper'

RSpec.describe Channel, type: :model do
  it "allows creation of a valid channel" do
    channel = create(:channel)
    expect(channel).to be_valid
  end

  it "does not allow an invalid name" do
    channel = build(:channel, name: "")
    expect(channel).to_not be_valid
  end

  it "does not allow an oversized name" do
    channel = build(:channel, name: 'a'*51)
    expect(channel).to_not be_valid
  end

  it "does not allow oversized descriptions" do
    channel = build(:channel, description: 'b'*1001)
    expect(channel).to_not be_valid

  end

end
