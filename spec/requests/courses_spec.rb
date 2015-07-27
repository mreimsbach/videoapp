require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe "GET /courses" do
    it "works! (now write some real specs)" do
      channel = create(:channel)
      get channel_courses_path(channel)
      expect(response).to have_http_status(200)
    end
  end
end
