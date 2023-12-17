class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

def index
   if params[:latest]
     @posts = Post.latest
   elsif params[:old]
     @posts = Post.old
   elsif params[:star_count_many]
     @posts = Post.star_count_many
   elsif params[:star_count_few]
     @posts = Post.star_count_few
   else
    @posts = Post.all
   end
   
   @posts = @posts.page(params[:page]).per(5)

    # @genres = Genre.all
  end


  def show
    @post = Post.find(params[:id])
    @genres = Genre.all
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "削除に成功しました"
    redirect_to admin_posts_path
  end
end
