class AttendancesController < ApplicationController

  def index
    @attendances = Attendance.all
  end

  def create
  end

  def show
  end

end
