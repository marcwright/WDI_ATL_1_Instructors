class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def create
    # binding.pry
    @song = Song.new(song_params)
    #should this have been done in the model?
    @song.preview_url = get_preview_url(@song.artist, @song.title)

    if @song.save
      render json: @song
    else
      render status: 400, nothing: true
    end
  end

  def destroy
    @song = Song.find(params[:id])

    if @song.destroy
      #why do we render an empty object?
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end

  def get_preview_url(artist, title)
    artist = artist.gsub(" ", "+")
    title = title.gsub(" ", "+")
    response = HTTParty.get("https://itunes.apple.com/search?term=#{artist}+#{title}&media=music&entity=musicTrack&limit=1")
    response_hash = JSON(response)
    response_hash["results"][0] ? response_hash["results"][0]["previewUrl"] : ""
  end

end
