class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
