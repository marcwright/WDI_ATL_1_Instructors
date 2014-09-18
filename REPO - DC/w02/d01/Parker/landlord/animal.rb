# #ADD ANIMALS TO THE LIST
# def list_animal_name(animal_name)
# 	animal_name.each_with_index do |animal_name, index|
# 		puts "Animal #{index + 1}"			
# end

# def add_animal_name(animal_name_array)
# 	animal_name     = get_answer_to("What is the animal's name?")
# 	species			= get_answer_to("What is the species?")
# 	animal age		= get_answer_to("What is the animal's age?")	
# new_ani = Animal.new(animal_name, species, animal_age)
# animal_name_array << new_ani
# puts ""
# puts "Great. You have added #{new_ani_name} to your list"	
# end

#Animal class (name, species, toys)
class Animal
	def initialize (animal_name, species)
		@animal_name = animal_name
		@species = species
		@toys = []
	end

	def animal_name
		return @animal_name
	end

	def animal_name=(animal_name)
		@animal_name = animal_name 
	end

	def species 
		return @species
	end

	def toys
		return @toys
	end

	def add_toy(toy)
		@toys.push(toy)
	end

end