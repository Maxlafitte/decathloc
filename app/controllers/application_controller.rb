class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: :home
  before_action :configure_permitted_parameters, if: :devise_controller?

  def home
  end

  def configure_permitted_parameters
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
