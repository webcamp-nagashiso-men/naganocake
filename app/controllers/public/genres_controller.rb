class GenresController < ApplicationController

  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])#いらない？
  end

  def index
  end

  def create
  end

  def edit
  end

  def update
  end

end
