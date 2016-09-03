class TrainingsController < ApplicationController


  def index
    @trainings = Training.active.order(:date_time).page params[:page]
  end

  def create
  end

  def new
  end

  def destroy
  end

  def update
  end
end
