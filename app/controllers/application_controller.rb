class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "У вас нет прав!"
    redirect_to root_url
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up).push(:city_id, :login, :fio, :birthday, :avatar)
      devise_parameter_sanitizer.for(:account_update).push(:city_id, :login, :fio, :birthday, :avatar)
    end
end
