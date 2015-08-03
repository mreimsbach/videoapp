require 'rails_helper'

RSpec.describe Video, type: :model do
  it "does save a valid video" do
    video = build(:video)
    expect(video).to be_valid
  end

  it "does not allow an empty name" do
    video = build(:video, name: " ")
    expect(video).to_not be_valid
  end

  it "does not allow oversized names" do
    video = build(:video, name: 'a'*51)
    expect(video).to_not be_valid
  end

  it "does not allow oversized descriptions" do
    video = build(:video, description: 'a'*1001)
    expect(video).to_not be_valid
  end

  it "does allow an non-overlong name" do
    video = build(:video, name: 'a'*50)
    expect(video).to be_valid
  end

  it "does allow an non-overlong description" do
    video = build(:video, description: 'a'*1000)
    expect(video).to be_valid
  end
end
