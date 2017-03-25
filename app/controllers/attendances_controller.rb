class AttendancesController < ApplicationController
  # before_action :find_user_training pas sûre que ça serve
  before_action :find_training, only: [:new]

  def index
    @attendances = Attendance.all
  end

  def new
    puts "########################################################################"
    @attendance = Attendance.new
    @test = 'normal'
  end

  def create
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
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
    params.require(:attendance).permit() # paramètres à définir
  end

  def find_attendance
    # sert à qqq chose ?
    @attendance = Attendance.find(params[:id])
  end

  def find_user_training
    # sert à qqq chose ?
    @training = Training.find(params[:id])
  end

  def find_training
    @training = Training.find(params[:training_id])
  end

end


