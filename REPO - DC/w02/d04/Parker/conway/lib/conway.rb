class Cell
	attr_reader :x, :y 

	def initialize(x, y, alive=true)  	
		@x = x
		@y = y
		@alive = alive
	end

	def alive?
		return @alive
	end

	def update
	 	@alive.status = alive
	end

end
