class Game
	def initialize
		array_of_live_cells = []
	end
end

class Cell
	
	attr_accessor :x_coord, :y_coord, :coordinates

	def initialize(x_coord, y_coord)
		@x_coord = x_coord
		@y_coord = y_coord
		@coordinates = "#{x_coord}, #{y_coord}"
	end
end	
