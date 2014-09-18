class Cell
  attr_accessor :x, :y, :alive

  def initialize(x, y, alive = true)
    @x = x
    @y = y
    @alive = alive
  end

  def add(cell)
    @board << cell
  end

end
