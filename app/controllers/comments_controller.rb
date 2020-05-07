class CommentsController < ApplicationController

  
  def create
    @comment = Comment.create(comment_params)
    redirect_to item_path(@comment.item.id)
  end
  
  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end
  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
