class TrainingsController < ApplicationController
  before_action :find_training,
    only: [:show, :update, :pick_teacher, :remove_teacher, :pick_board_member, :remove_board_member]
  before_action :find_user,
    only: [:remove_teacher]
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
    @attending_users = Attendance.where(training_id: params[:id])
    @attending_teachers = @training.teachers
    @attending_board_members = @training.board_members
  end

  def destroy
  end

  def update
    params[:training][:teacher_ids].each do |t|
      @teacher = User.find(t.to_i)
      @training.teachers << @teacher unless @training.teachers.include?(@teacher)
    end
    flash[:alert] = t 'training_updated'
    @training.save
    redirect_to training_path(@training)
  end

  def pick_teacher
    render layout: false
  end

  def pick_board_member
    render layout: false
  end

  def remove_teacher
    @training.remove_teacher(@teacher)
    redirect_to training_path(@training)
  end

  def remove_board_member
  end

  private

  def training_params
    params.require(:training).permit(:date_time, :theme, :location, :duration)
  end

  def find_training
    @training = Training.find(params[:id])
  end

  def find_user
    @teacher = User.find(params[:teacher_id])
  end

end


