require "rails_helper"

RSpec.describe CoursesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "channels/1/courses").to route_to("courses#index", :channel_id => "1")
    end

    it "routes to #new" do
      expect(:get => "channels/1/courses/new").to route_to("courses#new", :channel_id => "1")
    end

    it "routes to #show" do
      expect(:get => "channels/1/courses/1").to route_to("courses#show", :id => "1", :channel_id => "1")
    end

    it "routes to #edit" do
      expect(:get => "channels/1/courses/1/edit").to route_to("courses#edit", :id => "1", :channel_id => "1")
    end

    it "routes to #create" do
      expect(:post => "channels/1/courses").to route_to("courses#create", :channel_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "channels/1/courses/1").to route_to("courses#update", :id => "1", :channel_id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "channels/1/courses/1").to route_to("courses#update", :id => "1", :channel_id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "channels/1/courses/1").to route_to("courses#destroy", :id => "1", :channel_id => "1")
    end

  end
end
