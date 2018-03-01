class ArtistController < ApplicationController
  before_action :set_artist, only:[:show, :edit, :update, :destroy]

  def index
    @artists = Atrist.all
  end

  def new
    @atrist = Artist.new
  end

  def show
  end

  def edit
  end

  def create
    @atrist = Artist.new(artist_params)
    
      if @artist.save
        redirect_to artists_path(@artist)
      else
        render :new
      end

  end

  def update
    if @artist.update(artist_params)
      redirect_to artists_path(@artist)
    else 
      render :edit
    end
  end

  def destroy
    Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :genre, :bio)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

end
