class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(post_params(:name, :bio))
    @artist.save
    redirect_to @artist
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(post_params(:name))
    redirect_to @artist
  end

  private

  def post_params(*args)
     params.require(:artist).permit(*args)
  end
end
