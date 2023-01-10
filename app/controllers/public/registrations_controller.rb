class Public::RegistrationsController < ApplicationController
   before_action :configure_sign_up_params, only: [:create]
  
  def new
  end

  def create
  end
  
  
  protected
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end
  
  def after_sign_in_path_for(resource)
     public_customers_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
   
  protected
  
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name,:first_name,:family_kana,:first_kana,:postal_code,:address,:telephone_number]) 
  end

end