class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @datetime = Date.today
  end

  def stats
  end
end
