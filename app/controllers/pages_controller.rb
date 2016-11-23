class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @datetime = Date.today
    @attendances = Attendance.all
  end

  def stats
  end
end
