class TrainingsController < ApplicationController

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
    @training = Training.find(params[:id])
    @attending_users = Attendance.where(training_id: params[:id])
    @attending_teachers = @training.teachers
    @attending_board_members = @training.board_members
  end

  def destroy
  end

  def update
  end



  def remove_trainer
  end

  def add_board_member
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

end


