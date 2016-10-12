class TrainingsController < ApplicationController

  def index
    @trainings = Training.active.order(:date_time).page params[:page]
  end

  def create
  end

  def new
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
end
