#Spring Flowers
class Flower
	def initialize
		@Type = ''
		@Color = '' 
	end

	def type 
		return @type
	end

	def color 
		return @color
	end

	def how_to_pick
		puts "Break the stem"
	end
end

class Tulip < Flower
	def initialize(color)
		super
		@type = 'perennial'
		@color = purple
	end

class Rose < Flower(color)
	def initialize 
		super
		@type 'perennial'
		@color rose
	end

class Zinnia < Flower(color)
	def initialize 
		super 
		@type 'Zinnia'
		@color Yellow
	end
	
	def how_to_pick
		puts "Use Gloves"
		end
	end



# #Tulip (extends out of Flower)
# class Tulip(perennial) < Flower
# 	end

# #Zinnia (extends out of Flower)

# #