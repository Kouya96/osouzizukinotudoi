class Public::RegistrationsController < ApplicationController
   before_action :configure_sign_up_params, only: [:create]
  
  def new
  end

  def create
  end
  
  
  protected
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
  
  def after_sign_in_path_for(resource)
     public_sessions_create_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
   
  protected
  
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email]) 
  end

end