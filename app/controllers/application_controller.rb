class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_class == Reader
      devise_parameter_sanitizer.permit :sign_up, keys: [:library_card_id, :name, :address]
      devise_parameter_sanitizer.permit :account_update, keys: [:library_card_id, :name, :address, :avatar]        
    elsif resource_class == Admin 
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:dob,:phone,:image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:dob,:phone,:image])
    end
  end
end