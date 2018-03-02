class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:show, :update, :edit, :destroy]
  before_action :set_billboard_add, only: [:add_song_to_billboard]

  def index
    @billboards = Billboard.all
  end

  def add_song
    @songs = Song.all
    @billboard = Billboard.find(params[:id])
  end

  def add_song_to_billboard
      song = @billboard.songs.new
      song = @song
      song.save
      song.billboard_id = @billboard.id
      song.save
      render :show
      binding.pry
  end

  def show
    @song = Song.where(:billboard_id => nil)
  end

  def new
    @billboard = Billboard.new
    render partial: "form"
  end

  def edit
    render partial: "form"
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
  def set_billboard_add
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
