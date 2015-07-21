require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
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

  end

  describe "GET #show" do
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


  describe "GET #edit" do
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
  end
  describe "DELETE #destroy" do
    it "deletes other users as admin" do
      sign_in create(:user, admin: true)
      user = create(:user)
      delete :destroy, id: user
      expect(response).to redirect_to(users_admin_index_path)
      expect(User.where(id: user.id)).not_to exist
    end

    it "doesn't delete other users as non-admin" do
      user = create(:user)
      sign_in create(:user)
      delete :destroy, id: user
      expect(response).to redirect_to(root_path)
      expect(User.where(id: user.id)).to exist
    end
  end

  describe "PUT #update" do

      it "updates the requested channel" do
      #  user = User.create! valid_attributes
        sign_in create(:user, admin: true)
        @user = create(:user)
        new_username = "hallo"
        put :update, {:id => @user, :user => {username: new_username}}
        @user.reload
        expect(@user.username).to eq(new_username)
      end
  end
end
