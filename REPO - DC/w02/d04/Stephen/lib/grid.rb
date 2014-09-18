class Grid
  H_ADJ = [-1,0,1]
  V_ADJ = [-1,0,1]

  attr_accessor :cells
  def initialize
    @cells = []
  end

  def size
    return cells.size
  end

  def add_cell(cell)
    cells.push(cell)
  end

  def get_by_loc(x, y)
    cells.each do |cell|
      return cell if (cell.x == x && cell.y == y)
    end
  end

  def living_neighbors(cell)
    num_alive = 0

    H_ADJ.each do |h|
      V_ADJ.each do |v|
        # if not the cell itself
        if !(h == 0 && v ==0)
          cell = get_by_loc(cell.x + h, cell.y + v)
          living += 1 if cell.alive?
        end
      end
    end

    return num_alive
  end
end
