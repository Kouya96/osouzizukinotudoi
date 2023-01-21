class Public::CommentsController < ApplicationController
  before_action :ensure_guest_user, only: [:create]

  def create
    @item = Item.find(params[:item_id])
    @comment = current_user.comments.new(comment_params)
    @comment.item_id = @item.id
    @comment.save

    redirect_to request.referer
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to request.referer
  end


  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

  def ensure_guest_user
    @user = current_user
    if @user.last_name == "guestuser"
      redirect_to public_items_path , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
