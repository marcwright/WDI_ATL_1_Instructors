# #ADD SHELTERS TO YOUR LIST
# def add_shelter_name(shelter_name)
# 	shelter_name.each_with_index do |shelter_name, index|
# 		puts "Shelter #{index + 1}"
# end

# def add_shelter_name(shelter_name_array)
# 	shelter_name  	= get_answer_to("What is the name of the shelter?")
# 	animal_name		= get_answer_to("What kind of animals does the shelter have?")
# 	client_name		= get_answer_to("Does the animal belong to the shelter or client?")	
# new_cli = Shelter.new(shelter_name, animal_name, client_name)
# shelter_name_array << new_she
# puts ""
# puts "Great. You have added #{new_she_name} to your list"	
# end
# end

#Shelter Class (name, animals, clients) 
class Shelter
	def initialize (shelter_name, animal_name, client_name)
		@shelter_name = shelter_name
		@animal_name = animal_name
		@client_name = client_name
	end

	def shelter_name
		return @shelter_name
	end

	def shelter_name=(shelter_name)
		@shelter_name = shelter_name
		return shelter_name
	end

	def animal_name 
		return @animal_name
	end

	def animal_name=(animal_name)
		@animal_name = animal_name
		return @animal_name
	end

	def client_name
		return @client_name
	end

	def client_name=(client_name)
		@client_name = client_name
		return @client_name
	end
end

