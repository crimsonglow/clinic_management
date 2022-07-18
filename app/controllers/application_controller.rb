class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    case user
    when Doctor then doctor_path(current_user.id)
    when Patient then patient_path(current_user.id)
    when AdminUser then admin_root_path
    else
      root_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:phone_number])
  end
end
