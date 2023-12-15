class Public::GenresController < ApplicationController
  def show
    @genres = Genre.page(params[:page]).per(5)
    @genre = Genre.find(params[:id])
    @posts = @genre.posts
  end
end
