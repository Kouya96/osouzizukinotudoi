class Public::UsersController < ApplicationController
before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
        if @user.update(user_params)
           flash[:success] = "登録情報を変更しました。"
           redirect_to public_user_path
        else
            render 'edit'
        end
  end

  def unsubscride
  end

  def withdraw
    @user = current_user
    #@user.update(is_deleted: true)
    @user.destroy

        reset_session

        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :introduction, :id, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.last_name == "guestuser"
      redirect_to public_items_path , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
