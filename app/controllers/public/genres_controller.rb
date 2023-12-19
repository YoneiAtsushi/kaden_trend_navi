class Public::GenresController < ApplicationController
  # def show
    # @genres = Genre.page(params[:page]).per(5)
    # @genres = Genre.all
    # @genre = Genre.find(params[:id])
    # @posts = @genre.posts
  # end
  
  
  
  
  
  def show
   @genre = Genre.find(params[:id])
   @posts = @genre.posts
    
   if params[:latest]
     @posts = @posts.latest
   elsif params[:old]
     @posts = @posts.old
   elsif params[:star_count_many]
     @posts = @posts.star_count_many
   elsif params[:star_count_few]
     @posts = @posts.star_count_few
   else
    @posts = @posts.all
   end

    @posts = @posts.page(params[:page]).per(5)

    @genres = Genre.all
  end
  
  
  
  
end


