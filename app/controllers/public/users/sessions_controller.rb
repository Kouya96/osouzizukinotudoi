# frozen_string_literal: true

class Public::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :active_user!, only: [:create]

  #ゲストログイン
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to public_items_path, notice: 'ゲストユーザーでログインしました。'
  end

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

  private

  def active_user!
    user = User.find_by(email: params[:user][:email]) # フォームに入力されたメールアドレスでユーザーを取得
    return if user.nil? # ユーザーが取得できなければなにもしない
    return unless user.valid_password?(params[:user][:password]) # フォームに入力されたパスワードが間違っていればなにもしない
    unless user.is_active?
      redirect_to new_user_session_path, alert: "退会したユーザーはログイン出来ません"
    end
  end
end
