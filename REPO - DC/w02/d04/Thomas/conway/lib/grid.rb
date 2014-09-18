class Grid

  attr_accessor :board

  def initialize
    @board = []
  end

  def add(cell)
    board.push(cell)
  end

end
