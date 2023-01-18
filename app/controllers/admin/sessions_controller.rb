# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

# 管理者ログイン後トップ画面に推移
  def after_sign_in_path_for(resource)
    admin_homes_top_path
  end

# 管理者ログアウト後、ログイン画面に戻る
  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

  def destroy
    reset_session
    redirect_to new_admin_session_path
  end

   protected


  def session_params
    params.require(:session).permit(:name, :email)
  end


end
