class Registration::PatientController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  def create
    params[:user] = params[:user]&.merge(type: 'Patient')
    super
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.
      permit(:sign_up, keys: [:type, :name, :phone_number])
  end
end
