class Users::RegistrationsController < Devise::RegistrationsController
  
  respond_to :json
  
  private
  
  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed
  end
  
  def register_success
    render json: { message: 'Signed up.' }
  end
  
  def register_failed
    render json: { message: "Signed up failure." }
  end
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
