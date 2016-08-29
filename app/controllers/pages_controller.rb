class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @message = current_user.nil? ? "Please login" : "Welcome back"
    @datetime = Date.today
  end
end
