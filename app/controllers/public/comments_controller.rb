class Public::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
  if comment.save
    redirect_to request.referer
  else
    flash[:notice] = "※コメントが空白です"
    redirect_to request.referer
  end
end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "削除しました"
    redirect_to request.referer
  end
  
  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
