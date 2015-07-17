require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it "redirects index when not admin" do
    sign_in create(:user)
    get :index
    expect(response).to redirect_to(root_url)
    #expect(response).to render_template(:index)
  end
  it "redirects index when not logged in" do
    get :index
    expect(response).to redirect_to(new_user_session_url)
  end

  it "shows index when admin" do
    sign_in create(:user, admin: true)
    get :index
    expect(response).to render_template(:index)
  end

  it "redirects edit when not admin" do
    user = create(:user)
    sign_in user
    get :edit, id: user
    expect(response).to redirect_to(root_url)
  end

  it "redirects edit when not logged in" do
    user = create(:user)
    get :edit, id: user
    expect(response).to redirect_to(new_user_session_url)
  end

  it "shows edit when admin" do
    user = create(:user, admin: true)
    sign_in user
    get :edit, id: user
    expect(response).to render_template(:edit)
  end

  it "redirects show when not admin" do
    user = create(:user)
    sign_in user
    get :show, id: user
    expect(response).to redirect_to(root_url)
  end

  it "redirects show when not logged in" do
    user = create(:user)
    get :show, id: user
    expect(response).to redirect_to(new_user_session_url)
  end

  it "shows show when admin" do
    user = create(:user, admin: true)
    sign_in user
    get :show, id: user
    expect(response).to render_template(:show)
  end
  

end
