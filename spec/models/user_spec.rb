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

  it "should not make random user admin" do
    user = create(:user)
    expect(user).not_to be_admin
  end
end
