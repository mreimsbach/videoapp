require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "get #home" do
    subject { get :home }
    render_views
    it "should return the correct page" do
      expect(subject).to render_template(:home)
    end
    
  end
end
