
class Flower
	def initialize(type, color)
	 	@type = type
	  	@color = color
	  	@harvest_rules = "Break the stem."
	end

	def type
		return @type
	end

	def color
		return @color
	end

	def harvest_rules
		return @harvest_rules
	end
end

class Rose < Flower
	def initialize(type, color)
		super
		@harvest_rules = "Remember to wear gloves! Thorns!"
	end
end

tulip = Flower.new("perennial", "yellow")

zinnia = Flower.new("annual", "blue")

rose = Rose.new("perennial", "white")

rose2 = Rose.new("perennial", "red")


puts "what type of flower is the tulip?"
puts tulip.type

puts "what color is the zinnia?"
puts zinnia.color


puts "what are rose harvest rules?"
puts rose.harvest_rules

puts"what color is rose 2?"
puts rose2.color
