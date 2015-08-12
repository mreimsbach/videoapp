class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to action: 'show'
  end

  def destroy
    user = User.find(params[:id])
    destroy_comments(user)
    user.destroy
    redirect_to :action => 'index'
  end

  private
  def user_params
      params.require(:user).permit(:email, :username)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def destroy_comments(user)
    Video.all.each do |v|
      v.comments.where(user_id: user._id).destroy
    end
  end

end
