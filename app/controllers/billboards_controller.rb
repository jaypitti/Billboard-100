class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:add_song, :show, :update, :edit, :destroy]
  before_action :set_b_song_id, only: [:add_song_to_billboard]

  def index
    @billboards = Billboard.all
  end

  def add_song
    @songs = Song.all
    @billboard = Billboard.find(params[:id])
  end

  def add_song_to_billboard
    @songs = Song.all
    @billboard.billboard_songs = "#{@billboard.billboard_songs}, #{@song.id}"
    @array = @billboard.billboard_songs
    @a = @array.split(",")
    @billboard.billboard_songs = @a.join(",")
    @billboard.save
    render :show

  end

  def show
  end

  def new
    @billboard = Billboard.new
  end

  def edit
  end

  def create
    @billboard = Billboard.new(billboard_params)

    if @billboard.save
      redirect_to billboard_path(@billboard)
    else
      render :new
    end
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to @billboard
    else
      render :edit
    end
  end

  def destroy
    @billboard.destroy
    redirect_to billboards_path
  end

  private
  def set_b_song_id
    @billboard = Billboard.find(params[:b])
    @song = Song.find(params[:s])
  end
  def set_song
    @song = Song.find(params[:id])
  end

  def set_billboard
    @billboard = Billboard.find(params[:id])
  end

  def billboard_params
    params.require(:billboard).permit(:name)
  end
end
