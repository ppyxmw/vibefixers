class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email,
               :username,
               :password,
               :password_confirmation,
               :artist
              )
    end

    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:login,
               :password,
               :remember_me)
    end
  end
end
