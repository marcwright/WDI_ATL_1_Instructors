class WaterBottle

	def initialize
		@empty = true
	end

	def is_empty
		return @empty
	end

	def empty!
		@full = false
	end

	def fill!
		if empty?
			return false
		else
			@fill = true
		end
	end

	def read
		if empty?
			return "fill!"
		elseif !full?
		 	return "full!"
		else
		 	return "Thank you"
		end
	end
end


# class WaterBottle

# 	def initialize
# 		@full = true
# 		@empty = false
# 		@fill = ?\n
# 	end

# 	def full?
# 		return @full
# 	end

# 	def empty!
# 		@full = false
# 	end

# 	def fill!
# 		if empty?
# 			return false
# 		else
# 			@fill = true
# 		end
# 	end

# 	def read
# 		if empty?
# 			return "fill!"
# 		elseif !full?
# 		 	return "full!"
# 		else
# 		 	return "Thank you"
# 		end
# 	end
# end
