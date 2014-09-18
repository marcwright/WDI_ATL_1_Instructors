class Grid
  attr_reader :cells

  def initialize(cells={})
    @cells = cells
  end

  def get_cell(x,y)
    return @cells[make_key(x,y)]
  end

  def set_cell(x,y, status)
    @cells[make_key(x,y)] = status
  end

  def key_reverse(key)
    coords = key.split("_")
    return coords.map do |s|
      s.to_i
    end
  end

  def next
    old_cells = @cells
    @cells = {}

    old_cells.each_pair do |key, value|
      coords = key_reverse(key)

      (coords[0]-1..coords[0]+1).each do |x|
        (coords[1]-1..coords[1]+1).each do |y|
          set_cell(x, y, true)
        end
      end
    end

  end
private
  def make_key(x,y)
    return "#{x}_#{y}"
  end

end
