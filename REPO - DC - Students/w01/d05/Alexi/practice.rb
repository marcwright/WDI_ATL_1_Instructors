require 'pry'


class Shirts
  def initialize(size, color, text)
    @size = size
    @color = color
    @text = text
  end

  def size
    return @size
  end

  def color
    return @color
  end

  def text
    return @text
  end

end

pearl_jam_t = Shirts.new("XL","black","Yield Tour 1998")
# pearl_jam_t.size = "XL"
# pearl_jam_t.color = "black"
# pearl_jam_t.text = "Yield Tour 1998"

puts pearl_jam_t.size()
puts pearl_jam_t.color()
puts pearl_jam_t.text()
