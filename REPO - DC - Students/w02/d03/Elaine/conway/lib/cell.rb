class Cell
  attr_accessor :x_coord, :y_coord, :alive
  def initialize(x_coord, y_coord)
    @x_coord = x_coord
    @y_coord = y_coord
    @alive = true
  end


  def dead
    @dead = !alive
  end

  # def x_pos(cell)
  #   cell.x_coord
  # end

  # def y_pos(cell)
  # #   cell.y_coord
  # end
end
