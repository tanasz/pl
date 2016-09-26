class MembershipsController < ApplicationController

  def index
    @memberships = Membership.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @membership = Membership.find(params[:id])
    @user = @membership.user
  end

  def update
  end

  def destroy
  end
end
