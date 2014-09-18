# Song
# - title
# - artist
# - genre
# - play

# Instantiate a few songs to test your class.

class Song

  def initialize(options)
    @title = options[:title]
    @artist = options[:artist]
    @genre = options[:genre]
  end

  def title
    return @title
  end

  def artist
    return @artist
  end

  def genre
    return @genre
  end

  def play
    return "#{self.title()} by #{self.artist()} is playing."
  end

  def stop

  end
end

hips_dont_lie = Song.new({
  name: "Hips Don't Lie",
  artist: "Shakira",
  genre: "Puhp"
})

puts hips_dont_lie.title()
puts hips_dont_lie.artist()
puts hips_dont_lie.genre()
puts hips_dont_lie.play()