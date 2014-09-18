class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

   def create
    @song = song.new(song_params)

    if @song.save
      render json: @song
    else
      render status: 400, nothing: true
    end
  end

  def destroy
    @song = song.find(params[:id])

    if @song.destroy
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private

  def song_params
    params.require(:song).permit(:artist, :title, :preview_url)
  end

end
