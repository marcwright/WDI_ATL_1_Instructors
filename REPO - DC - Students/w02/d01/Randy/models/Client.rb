class Client
	attr_reader :name
	attr_reader :age
	attr_accessor :pets

	def initialize(name, age)
		@name = name
		@age = age
		@pets = []
	end
	
def has_pet?
	if pets.size > 0
			return true
		else
			return false
		end
	end

	def list_pets
		if self.has_pet?
			self.pets.each_with_index{ |pet, index|
				puts "#{index + 1} --> #{pet.name}: #{pet.species}"}
		else
			puts "There are currently no animals."
		end
	end
end