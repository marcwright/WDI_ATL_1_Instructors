class Shelter
	attr_accessor :name
	attr_accessor :animals
	attr_accessor :clients

	def initialize (name)
		@name = name
		@animals = []
		@clients = []
	end

	def has_animals?
		if animals.size > 0
			return true
		else
			return false
		end
	end

	def has_clients?
		if clients.size > 0
			return true
		else
			return false
		end
	end

	def list_animals
		if self.has_animals?
			animals.each_with_index{ |animal, index|
				puts "#{index + 1} --> Animal Name: #{animal.name} Animal Type: #{animal.species}"}
		else
			puts "There are currently no animals."
		end
	end

	def list_clients
		if self.has_clients?
			self.clients.each_with_index{ |client, index|
				puts "#{index + 1} --> Client Name:#{client.name} Client Age:#{client.age}"}
		else
			puts "There are currently no clients."
		end
	end

	def create_an_animal
		puts "What is the animals name?"
		name = gets.chomp
		puts "What is the animals species?"
		species = gets.chomp
		new_animal = Animal.new(name, species)
		puts "Does the animal have any toys? (y/n)"
		answer = gets.chomp
			while answer != "n"
				puts "What is the toy?"
				toy = gets.chomp
				new_animal.toys << toy
				puts "Are there any more toys? (y/n)"
				answer = gets.chomp
			end
		return new_animal
	end

	def create_a_client
		puts "What is the clients name?"
		name = gets.chomp
		puts "What is the clients age?"
		age = gets.chomp
		new_client = Client.new(name, age)
		puts "Does the client have any pets? (y/n)"
		answer = gets.chomp
			while answer != "n"
				new_client.pets << self.create_an_animal
				puts "Does the client have any more pets? (y/n)"
				answer = gets.chomp
			end
		return new_client
	end

	def adopt_an_animal
		puts "Which client is adopting (please select the number to the left)?"
		self.list_clients
		input_about_client = gets.to_i
		adopting_client = self.clients[input_about_client - 1]
			if adopting_client.pets.length < 2
			puts "What pet is being adopted?"
			self.list_animals
			input_about_animal = gets.to_i
			adopted_animal = self.animals[input_about_animal - 1]
			adopting_client.pets << adopted_animal
			self.animals.delete(adopted_animal)
			else
				puts "You cannot adopt another pet!"
			end
	end

	def up_for_adoption
		puts "Which client is putting their pet up for adoption? (please select the number to the left)?"
		self.list_clients
		input_about_client = gets.to_i
		adopting_client = self.clients[input_about_client - 1]
		
		puts "What pet is being put up for adoption??"
		adopting_client.list_pets
			input_about_pet = gets.to_i
			up_for_adoption_pet = adopting_client.pets[input_about_pet - 1]
		self.animals << up_for_adoption_pet
		adopting_client.pets.delete_at(input_about_pet - 1)
	end
end


