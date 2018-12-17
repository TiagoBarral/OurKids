class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo, :photo_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :photo, :photo_cache])
  end

  def after_sign_in_path_for(resource_or_scope)
    families_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
