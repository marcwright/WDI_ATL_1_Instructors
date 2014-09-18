class Grid
  attr_accessor :grid_array

  def initialize
    @grid_array = []
  end

  def add_cell(cell)
    @grid_array.push(cell)
  end


  def live_neighbors(cell_object)
    live_neighbor_array = @grid_array.select do |cell|
      cell.status == true
    end
    @live_neighbor_count = live_neighbor_array.length
  end

  def tick_result(cell_object)
    if live_neighbors(cell_object) <= 2
      @grid_array.delete(cell_object)
    end


  end
end
