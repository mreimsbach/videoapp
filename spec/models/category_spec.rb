require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is invalid without text" do
    expect(build(:category, tag: nil)).to_not be_valid
  end

  it "is invalid with an empty text" do
    expect(build(:category, tag: "")).to_not be_valid
  end

  it "is can have multiple videos" do
    category = create(:category)
    5.times do
      category.videos.build(attributes_for(:video))
    end
    expect(category.videos.count)  == 5
  end

  it "is unique" do
    category = create(:category, tag: "hipster")
    expect{create(:category, tag: "hipster")}.to raise_error(Mongoid::Errors::Validations)
  end

  it "is not overly long" do
    expect(build(:category, tag: 'a'*21)).to_not be_valid
  end

  it "allows texts with 20 characters" do
    expect(create(:category, tag: 'a'*2)).to be_valid
  end

end
