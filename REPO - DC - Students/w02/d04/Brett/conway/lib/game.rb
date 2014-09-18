
class Game
attr_accessor :live_cells, :dead_cells

  def initialize
    @live_cells = []
    @dead_cells
  end

  def add_cell(coordinates)
    if @live_cells.include?(coordinates)
    else
      @live_cells << coordinates
    end
  end

  def count_neighbors(cell)
      @live_cells.count do |live_cell|
        (cell[0] - live_cell[0]).abs == 1 || (cell[1] - live_cell[1] ).abs == 1
      end
  end

  def tick(cell)
    @dead_cells = @live_cells.map { |live_cell| count_neighbors(live_cell) < 2 }
    if count_neighbors(cell) < 2
      @live_cells.delete(cell)
    else
    end

  end
end
