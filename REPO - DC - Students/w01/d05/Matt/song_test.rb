req

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
  title: gets.chomp,
  artist: gets.chomp,
  genre: gets.chomp
})

puts hips_dont_lie.title()
puts hips_dont_lie.artist()
puts hips_dont_lie.genre()

