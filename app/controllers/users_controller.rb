class UsersController < ApplicationController

  def index
    @users = User.order(:last_name).page params[:page]
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @memberships = @user.get_memberships
    @attendances = @user.get_attendances
  end

  def update
  end

  def destroy
  end

end
