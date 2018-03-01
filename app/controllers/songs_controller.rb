class SongsController < ApplicationController::Base
  before_action :set_artist_song, :set_billboard_song, :song_params

def index
@artist_songs = @artist.songs.all
end
  def create
    if @artist_song != nil
      @artist_song = @artist.songs.new
    elsif @billboard_song != nil
      @billboard_song = @billborad.songs.new
    else
      redirect_to artists_path
    end

    # /views/artists/index.html.erb
    #
    # <%= @artist_song.each do |s| %>
    # <p><% s.name %>
    # <% end %>
    #
    # /

    def edit
      if @artist_song != nil
        @artist_song = @artist.songs.new
      elsif @billboard_song != nil
        @billboard_song = @billborad.songs.new
      else
      end
      @num = 1
      @num.save
      def update
        if @artist_song != Artist.new(song_params)
          @artist_song = @artist.songs.new
          @artist_song.save
        elsif @billboard_song != Billboard.new(song_params)
          @billboard_song = @billborad.songs.new
          @billboard_song.save
        else
        end

        def destroy
          if @artist_song
            @artist_song.destroy
          else
            @billboard_song.destroy
          end
        end

        private

        def set_artist_song
          @artist = Artist.find_by(:artist_id)
        end

        def set_billboard_song
          @billboard = Billboard.find_by(:billboard_id)
        end
        def song_params
          params.require(:song).permit(:name, :artist, :duration, :artwork)
        end

      end
