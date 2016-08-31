class UsersController < ApplicationController

  def index
    @users = User.order(:last_name).page params[:page]
    #@users = User.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
