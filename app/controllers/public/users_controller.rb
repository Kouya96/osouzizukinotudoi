class Public::UsersController < ApplicationController
  def show
    @user = current_user
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
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :introduction, :id)
  end

end
