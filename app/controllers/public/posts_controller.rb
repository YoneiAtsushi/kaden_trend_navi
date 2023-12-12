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
   
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :product_name, :introduction, :genre_id, :star)
  end


end
