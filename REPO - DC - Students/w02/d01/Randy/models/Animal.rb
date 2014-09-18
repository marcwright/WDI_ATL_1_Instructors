class Animal
	attr_reader :name
	attr_reader :species
	attr_accessor :toys
	def initialize(name, species)
		@name = name
		@species = species
		@toys = []
	end
end