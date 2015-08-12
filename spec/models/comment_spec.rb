require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "Shows that lint is correct" do
    expect(build(:comment)).to be_valid
  end

  it "does not save oversized texts" do
    expect(build(:comment, text: 'a'*1001)).to_not be_valid
  end

  it "requires a user_id" do
    expect(build(:comment, user_id: nil)).to_not be_valid
  end


end
