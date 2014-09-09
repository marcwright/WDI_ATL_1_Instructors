# Song
# - title
# - artist
# - genre

# Instantiate a few songs to test your class.

class Song
  def initialize(options)
    @title = options[:title]
    @artist = options[:artist]
    @genre = options[:genre]
  end

  def title=(title)
    @title = title
  end

  def title
    return @title
  end

  def artist=(artist)
    @artist = artist
  end

  def artist
    return @artist
  end

  def genre=(genre)
    @genre = genre
  end

  def genre
    return @genre
  end

  def play
    return "#{self.title()} by #{self.artist()} is playing."
  end

  def stop
    # TODO: stop the music!
  end
end

hips_dont_lie = Song.new({
  title: "Hips Don't Lie",
  artist: "Shakira",
  genre: "Puhp"
})

puts hips_dont_lie.title()
puts hips_dont_lie.artist()
puts hips_dont_lie.genre()


# Playlist
# - songs
# - start (a random song starts)
# - skip (another random song is played)
# - add songs
# - remove songs
# - currently playing song

class Playlist
  def initialize
    @songs = []
    @index = 0
  end

  def songs
    return @songs
  end

  def current_song
    return self.songs[@index]
  end

  def add_song(song)
    self.songs.push(song)
  end

  def remove_song(song)
    self.songs.push(delete)
  end

  def play
    if self.current_song()
      self.current_song.play()
    end
  end

  # Shuffles the order of the song array
  def shuffle
    @songs.shuffle!()
  end

  #Should this playlist repeat when it gets to the end?
  def should_repeat?

  end

  # Should pause the playback of the current song
  def pause

  end

  # Advance to the next song in the list
  def next_song

  end

  # Go back to the previous song in the list
  def prev_song

  end
end

playlist = Playlist.new
playlist.add_song(hips_dont_lie)
playlist.play()
