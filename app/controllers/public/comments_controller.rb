class Public::CommentsController < ApplicationController
 
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
    params.permit(:comment)
  end
end
