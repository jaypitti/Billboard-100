class SongsController < ApplicationController
  before_action :set_artist, only: [:create, :new, :show, :edit, :update, :destroy]


  # :set_artist_song,
  def index
    @songs = @artist.songs.all
  end

  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)

    if @song.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end
  #GET /billboards/:billboard_id/add_song/:id

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_billboard
    @billboard = Billboard.find(params[:id])
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
  def song_params
    params.require(:song).permit(:title, :duration, :artwork)
  end
end
