class Admin::CommentsController < ApplicationController
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "削除しました"
    redirect_to request.referer
  end
end

