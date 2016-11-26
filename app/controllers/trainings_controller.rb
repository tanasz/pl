class TrainingsController < ApplicationController
  before_action :find_training, only: [:pick_teacher,:show]

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
  end

  def pick_teacher
    @teachers = User.teachers.all
  end

  def remove_teacher
  end

  def add_board_member
  end

  def remove_board_member
  end

  private

  def training_params
    params.require(:training).permit(:date_time, :theme, :location, :duration)
  end

  def find_trainingeuh
    @training = Training.find(params[:id])
  end

  def find_training
    @training = Training.find(params[:id])
    #@training = Training.find(1026)
    @toto = 'berk'
  end

end


