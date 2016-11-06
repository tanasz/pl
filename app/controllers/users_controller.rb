class UsersController < ApplicationController

  def index
    @users = User.order(:last_name).page params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
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

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :date_of_birth, :birthplace_city, :birthplace_postcode, :birthplace_country, :is_board_member, :is_teacher, :mobile_phone, :emergency_contact_name, :emergency_contact_phone, :emergency_contact_relationship, :photo, :gender, :address, :postcode, :city, :country)
  end

  def find_user
    @user = User.find(params[:id])
  end

end


