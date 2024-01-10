class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if post_params[:image]
      tags = Vision.get_image_data(post_params[:image])
    end
     if @post.save
        if post_params[:image]
          tags.each do |tag|
            @post.tags.create(name: tag)
          end
        end
        flash[:notice] = "投稿に成功しました。"
        redirect_to post_path(@post.id)
     else
        render :new
     end
  end

# 並べ替え
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
    @genres = Genre.all

  end

  def show
    @genres = Genre.all
    @post = Post.find(params[:id])
    @comment = Comment.new
    # @comments = Comment.all
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "削除に成功しました"
    redirect_to '/posts'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
     @post = Post.find(params[:id])
     if post_params[:image]
       tags = Vision.get_image_data(post_params[:image])
     end
     if @post.update(post_params)
      # Tag.wherer(post_id:@post.id)
      if post_params[:image]
        @post.tags.destroy_all
        tags.each do |tag|
          @post.tags.create(name: tag)
        end
      end
      flash[:notice] = "投稿を更新しました"
      redirect_to post_path(@post.id)
     else
      render :edit
     end
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :product_name, :introduction, :genre_id, :star)
  end


# end
