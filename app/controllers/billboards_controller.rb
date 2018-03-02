class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:show, :update, :edit, :destroy]
  def index
    @billboards = Billboard.all
  end

  def show
    @billboard = Billboard.new(billboard_params)
    @song = set_song
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

  def set_billboard

    @billboard = Billboard.find(params[:id])
  end
  def set_song
    @song = Song.find(params[:id])
  end
  def billboard_params
    params.require(:billboard).permit(:name)
  end
end
