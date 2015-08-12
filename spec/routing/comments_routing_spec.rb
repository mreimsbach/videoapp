require "rails_helper"

RSpec.describe CommentsController, type: :routing do
  describe "routing" do


    it "routes to #new" do
      expect(:get => "videos/1/comments/new").to route_to("comments#new", :video_id => "1")
    end

    it "routes to #create" do
      expect(:post => "videos/1/comments").to route_to("comments#create", :video_id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "videos/1/comments/1").to route_to("comments#destroy", :id => "1", :video_id => "1")
    end

  end
end
