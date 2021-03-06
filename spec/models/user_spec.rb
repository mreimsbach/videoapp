require 'rails_helper'
#require 'user'

RSpec.describe User, type: :model do

  it "makes Michael an admin" do
    user = create(:user, email: "mreimsbach@avarteq.de")
    expect(user).to be_admin
  end

  it "makes Sven an admin" do
    user = create(:user, email: "sschmidt@avarteq.de")
    expect(user).to be_admin
  end

  it "does not make a random user an admin" do
    user = create(:user)
    expect(user).not_to be_admin
  end

  it "does not allow an empty username" do
    user = build(:user, username: "")
    expect(user).to_not be_valid
  end

  it "does not allow oversized usernames" do
    user = build(:user, username: 'a'*51)
    expect(user).to_not be_valid
  end
  it "does allow a non-oversized username" do
    user = build(:user, username: 'a'*50)
    expect(user).to be_valid
  end

  it "creates channel after creating new user" do
    user = create(:user)
    user.reload
    expect(user.channel).to be_present
  #  expect(Channel.find_by(user: user.id)).to exist
  end


end
