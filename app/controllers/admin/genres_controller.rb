class Admin::GenresController < ApplicationController
  def index
    @Genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to admin_genres_path
  end

  def edit
  end

  def update
  end

  private
  def genre_params
    params.permit(:name)
  end

end
