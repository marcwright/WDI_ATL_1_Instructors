class Cell
  attr_accessor :status
  def initialize(x_coord,y_coord)
    @x_coord = x_coord
    @y_coord = y_coord
    @status = true
    #@neighbor_array = [Cell(x_coord-1, y_coord-1), [x_coord, y_coord-1], [x_coord+1, y_coord-1], [x_coord-1, y_coord], [x_coord+1, y_coord], [x_coord-1, y_coord+1], [x_coord, y_coord+1], [x_coord+1, y_coord+1]]
  end
end
