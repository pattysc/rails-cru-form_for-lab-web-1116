class SongsController < ApplicationController

  def show
    @song = Song.find(params[:id])
    @genre = @song.genre
    @artist = @song.artist
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(post_params(:name, :artist_id, :genre_id))
    @song.save
    redirect_to @song
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(post_params(:name, :artist_id, :genre_id))
    redirect_to @song
  end

  def index
    @songs = Song.all
  end

  private

  def post_params(*args)
     params.require(:song).permit(*args)
  end
end