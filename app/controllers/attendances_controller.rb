class AttendancesController < ApplicationController
  before_action :find_user_training, only: [:new_teacher, :new_board_member]
  before_action :find_training, only: [:new]

  def index
    @attendances = Attendance.all
  end

  def new
    @attendance = Attendance.new
    @test = 'normal'
  end

  def new_teacher
    @attendance = Attendance.new
    @test = 'teacher'
  end

  def new_board_member
    @attendance = Attendance.new
    @test = 'board_member'
  end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      redirect_to attendance_path(@attendance)
    else
      render :new
    end
  end

  def show
  end

  def destroy
  end

  def update
  end

  private

  def attendance_params
    params.require(:attendance).permit()
  end

  def find_attendance # utile ?
    @attendance = Attendance.find(params[:id])
  end

  def find_user_training
    @training = Training.find(params[:id])
  end

  def find_training
    @training = Training.find(params[:training_id])
  end

end


