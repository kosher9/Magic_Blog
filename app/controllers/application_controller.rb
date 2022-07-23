class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource_or_scope)
  #   users_path
  # end

  # def after_sign_out_path_for(resource_or_scope)
  #   redirect_to new_user_session_path
  # end

  protected

  def configure_permitted_parameters
    attributes = %i[name email password]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
