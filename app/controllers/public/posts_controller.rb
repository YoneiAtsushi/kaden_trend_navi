class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end
  
  def index
    @posts = Post.all
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end

   private

  def post_params
    params.require(:post).permit(:title, :image, :product_name, :introduction, :genre_id, :ster)
  end


end
