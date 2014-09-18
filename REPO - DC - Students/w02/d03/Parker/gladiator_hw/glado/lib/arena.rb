class Gladiator 
	attr_reader :name, :weapon

	def initialize(name, weapon)
		@name = name
		@weapon = weapon
	end

	def name 
		return @name
	end

	def weapon
		return @weapon
	end
end
