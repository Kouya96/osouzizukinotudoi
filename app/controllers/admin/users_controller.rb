class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def withdraw
    @user = User.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_active: false)
    redirect_to admin_users_path
  end

  def restore
    @user = User.find(params[:id])
    @user.update(is_active: true)
    redirect_to admin_users_path
  end

end
