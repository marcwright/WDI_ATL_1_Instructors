require_relative 'grid'

class Cell
  attr_accessor :x_coord, :y_coord
  def initialize(x_coord, y_coord)
    @x_coord = x_coord
    @y_coord = y_coord
  end

  def find_neighbors_locals
    result = []
    # neg_and_plus_one = [-1, 1]
    (-1..1).each do |h|
      (-1..1).each do |v|
        if h != 0 && v != 0
      result.push([@x_coord+h, y_coord+v])
      result.push([@x_coord+h, y_coord])
      result.push([@x_coord, y_coord+v])
      result = result.uniq
        end
      end
    end
      binding.pry
      return result
    end
end
