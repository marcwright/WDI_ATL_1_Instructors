class MusicsController < ApplicationController


  def index
    @musics = Music.all
  end

  def create
  end


  private

  def get_preview_url(artist, song)
    artist = http://artist.name.gsub(" ", "+")
    song = song.title.gsub(" ", "+")
    response = HTTParty.get("https://itunes.apple.com/search?term=#{artist}+#{song}&media=music&entity=musicTrack&limit=1")
    response_hash = JSON(response)
    return response_hash["results"][0]["previewUrl"]
  end

end
