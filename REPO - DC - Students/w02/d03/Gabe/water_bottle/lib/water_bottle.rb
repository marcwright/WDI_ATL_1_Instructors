
class WaterBottle

	def initialize
		@is_empty = true
		@drinks_containing = 0
	end

	def is_empty?
		return @is_empty
	end

	def fill
		if @is_empty == true
		@drinks_containing = 3
		@is_empty = false
		return "filled!"
			else
				false
		end
	end

	def dispense
		return "Water"
	end
	

end