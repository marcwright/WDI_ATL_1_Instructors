require "pry"

class Cell
  attr_reader :x_coord, :y_coord
  attr_writer :x_coord, :y_coord

  def initialize(x_coord, y_coord)
    @x_coord = x_coord
    @y_coord = y_coord
  end

end

class Game
  attr_reader :cells
  attr_writer :cells

  def initialize(cells = [])
    @cells = cells
  end
#binding.pry
end
