class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale
#  include Pundit

#  after_action  :verify_authorized, except: :index, unless: :skip_pundit?
#  after_action  :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *get* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  # ----- I18n integration -----
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    puts ">#{I18n.locale}<"
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end
  # ----------------------------

  private
#  def skip_pundit
#    devise_controller? || params[:controller] =~ /^(active_)?admin/
#  end

end
