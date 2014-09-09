def get_spotify_uri(song)
  song = song.title.gsub(" ", "+")
  response = HTTParty.get("http://ws.spotify.com/search/1/track.json?q=#{song}")
  response["tracks"][0] ? response["tracks"][0]["href"] : ""
end