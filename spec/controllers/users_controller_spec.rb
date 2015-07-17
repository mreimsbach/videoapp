require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it "should redirect index when not admin" do
    sign_in create(:user)
    get :index
    expect(response).to redirect_to(root_url)
    #expect(response).to render_template(:index)
  end
  it "should redirect index when not logged in" do
    get :index
    expect(response).to redirect_to(new_user_session_url)
  end

end
