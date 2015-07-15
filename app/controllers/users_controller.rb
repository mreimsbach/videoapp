class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
  end

  def destroy
    User.find(params[:id]).destroy
  end

  private
  def user_params
      params.require(:user).permit(:email, :first_name, :last_name)
  end


end
