require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'


get '/' do
  erb :home
end

get '/search' do
  song_name = params[:song].gsub(" ", "%20")
  @results = HTTParty.get("http://ws.spotify.com/search/1/track.json?q=#{song_name}")
  @uri = @results["tracks"][0]["href"]
  erb :search
end

# How to embed a Spotify Play Button
# https://developer.spotify.com/technologies/widgets/spotify-play-button/

# Spotify Search API
# https://developer.spotify.com/technologies/web-api/search/