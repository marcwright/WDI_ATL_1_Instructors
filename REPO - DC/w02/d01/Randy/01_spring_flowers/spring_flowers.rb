# It's springtime! Let's grow some flowers… Complete this exercise in a new files called `spring_flowers.rb`:

# 1. Define an abstract **Flower** class with the following:
# 	* type = getter method specifying 'annual' / 'perennial'
# 	* color = getter method specifying your pick of color keywords.
# 	* harvest_rules = provides instructions on how to pick the flower.

class Flower
	def initialize(color)
		@color = color
		@harvest_method = "Break the stem"
	end

	def type
		return @type
	end

	def color
		return @color
	end

	def harvest_method
		puts @harvest_method
	end
end

class Tulip < Flower
	def initialize(color)
		super
		@type = "perennial"
	end
end

class Zinnia < Flower
	def initialize(color)
		super
		@type = "annual"
	end
end

class Rose < Flower
	def initialize(color)
		super
		@type = "perennial"
		@harvest_method += " and wear gloves!!"
	end
end

flower1 = Tulip.new("yellow")
flower2 = Rose.new("red")

puts flower1.type
puts flower1.harvest_method
puts flower1.color

puts flower2.type
puts flower2.harvest_method
puts flower2.color


# 2. Create the following flowers:
# 	* Tulip (perennial)
# 	* Zinnia (annual)
# 	* Rose (perennial)
# 3. Customize the `harvest_rules` instructions…
# 	* All flowers should specify "Break the stem" by default.
# 	* A rose should instruct us to wear gloves!