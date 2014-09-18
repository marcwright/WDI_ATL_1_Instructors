class SongsController < ApplicationController
  before_action :find_artist, only: [:new, :create]
  before_action :find_song, only: [:edit, :update, :destroy]

  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)
    save_song
  end

  def edit
  end

  def update
    @song.assign_attributes(song_params)
    @artist = @song.artist
    save_song
  end

  def destroy
    @artist = @song.artist
    @song.destroy
    redirect_to @artist
  end

  private
  def find_artist
    @artist = Artist.find(params[:artist_id])
  end

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :year, :artist_id)
  end

  def save_song
    if @song.save
      redirect_to @song
    else
      case params[:_method]
      when "post" then render :new
      when "patch" then render :edit
      end
    end
  end
end
