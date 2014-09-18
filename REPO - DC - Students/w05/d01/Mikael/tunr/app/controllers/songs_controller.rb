class SongsController < ApplicationController
  before_action :find_song, only: [:edit, :update, :destroy]

  def new
    @song = Song.new(artist_id: params[:artist_id])
  end

  def create
    @song = Song.create(song_params)
    redirect_to artist_path
  end

  def update
    @song.update(artist_params)
    redirect_to @song
  end

  def destroy
    @song.destroy
    redirect_to root_path
  end

  private

    def find_song
      @song = Song.find_by(params[:artist_id])
    end

    def song_params
      params.require(:song).permit(:name, :year)
    end

end
