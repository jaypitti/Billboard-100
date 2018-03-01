class SongsController < ApplicationController
  before_action :set_billboard_song, :song_params

  # :set_artist_song,

  def index
    @artist_songs = @artist.songs.all
  end

  def create
    if @artist_song != nil
      @artist_song = @artist.songs.new
    else
      redirect_to artists_path
    end
  end
  #GET /billboards/:billboard_id/add_song/:id
  def add_song
    song = Song.find(params[:id])
    song.billboard_id = params[:billboard_id]
    if song.save
      redirect_to billboard_path(song.billboard_id)
    else
      redirect_to new_billboard_song
    end
  end

  def edit
    if @artist_song != nil
      @artist_song = @artist.songs.new
    elsif @billboard_song != nil
      @billboard_song = @billborad.songs.new
    else
    end
  end

  def update
    if @artist_song != Artist.new(song_params)
      @artist_song = @artist.songs.new
      @artist_song.save
    elsif @billboard_song != Billboard.new(song_params)
      @billboard_song = @billborad.songs.new
      @billboard_song.save
    else
    end
  end

  def destroy
    if @artist_song
      @artist_song.destroy
    else
      @billboard_song.destroy
    end
  end

  private

  # def set_artist_song
  #   @artist = Artist.find_by(:id)
  # end

  def set_billboard_song
    @billboard = Billboard.find_by(params[:id])
  end
  def song_params
    params.require(:song).permit(:name, :duration, :artwork)
  end

end
