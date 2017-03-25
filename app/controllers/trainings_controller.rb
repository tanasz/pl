class TrainingsController < ApplicationController
  before_action :find_training,
    only: [:show, :update]
  before_action :find_training_id,
    only: [:new_teacher, :new_board_member, :destroy_teacher, :destroy_board_member]
  before_action :find_user,
    only: [:destroy_teacher, :destroy_board_member]

  def index
    @trainings = Training.active.order(:date_time).page params[:page]
  end

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    if @training.save
      redirect_to training_path(@training)
    else
      render :new
    end
  end

  def show
    @attending_users          = Attendance.where(training_id: params[:id])
    @attending_teachers       = @training.teachers.order(:last_name)
    @attending_board_members  = @training.board_members.order(:last_name)
  end

  def destroy
  end

  def update
    teacher_list      = params[:training][:teacher_ids] ||= ''
    board_member_list = params[:training][:board_member_ids] ||= ''

    teacher_list.each do |t|
      @teacher = User.find(t.to_i)
      @training.teachers << @teacher unless @training.teachers.include?(@teacher)
    end unless teacher_list.size < 1

    board_member_list.each do |b|
      @board_member = User.find(b.to_i)
      @training.board_members << @board_member unless @training.board_members.include?(@board_member)
    end unless board_member_list.size < 1

    flash[:alert] = t 'training_updated'

    @training.save
    redirect_to training_path(@training)
  end

  def new_teacher
    render layout: false
  end

  def new_board_member
    render layout: false
  end

  def destroy_teacher
    @training.delete_teacher(@user)
    redirect_to training_path(@training)
  end

  def destroy_board_member
    @training.delete_board_member(@user)
    redirect_to training_path(@training)
  end

  private

  def training_params
    params.require(:training).permit(:date_time, :theme, :location, :duration)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def find_training
    @training = Training.find(params[:id])
  end

  def find_training_id
    @training = Training.find(params[:training_id])
  end


end


