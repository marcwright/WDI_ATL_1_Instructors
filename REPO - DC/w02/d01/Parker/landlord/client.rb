# #ADD CLIENTS TO YOUR LIST
# def list_client_name(client_name)
# 	client_name.each_with_index do |client_name, index|
# 		puts "Client #{index + 1}"
# end

# def add_client_name(client_name_array)
# 	client_name   	= get_answer_to("What is the client's name?")
# 	client_age		= get_answer_to("What is the species?")
# 	pet_name		= get_answer_to("What is their pet's name?")	
# new_cli = Client.new(client_name, client_age, pet_name)
# client_name_array << new_cli
# puts ""
# puts "Great. You have added #{new_cli_name} to your list"	
# end


#Client Class (name, age, pet(s))
class Client
	def initialize (client_name, age)
		@client_name = client_name 
		@age = age
		@pet_name = []
	end

	def client_name
		return @client_name
	end

	def client_name=(client_name)
		@client_name = client_name
	end

	def age 
		return @age
	

	def pet_name
		return @pet_name
	end

	def pet_name=(pet_name)
		@pet_name.push(pet_name)
	end
end