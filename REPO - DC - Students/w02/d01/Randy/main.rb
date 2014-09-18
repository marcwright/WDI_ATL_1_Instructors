require_relative 'models/Animal'
require_relative 'models/Client'
require_relative 'models/Shelter'
require_relative 'Seeds/seeds'


def create_an_animal_local(shelter_instance)
	shelter_instance.animals << shelter_instance.create_an_animal
end

def create_a_client_local(shelter_instance)
	shelter_instance.clients << shelter_instance.create_a_client
end

def view_list_of_animals_local(shelter_instance)
	shelter_instance.list_animals
end

def view_list_of_clients_local(shelter_instance)
	shelter_instance.list_clients
end

def adoption_local(shelter_instance)
	shelter_instance.adopt_an_animal
end

def up_for_adoption_local(shelter_instance)
	shelter_instance.up_for_adoption
end



def list_options
puts "Please select an option:"
puts "0 --> Quit"
puts "1 --> Create an Animal"
puts "2 --> Create a Client"
puts "3 --> View a List of Animals"
puts "4 --> View a List of Clients"
puts "5 --> Client wants to Adopt"
puts "6 --> Put an Animal up for Adoption"
end

menu_answer = ""
puts "Welcome to #{$totally_legit_shelter.name}"
while menu_answer != "0"

	list_options
	menu_answer = gets.chomp
	case menu_answer
	when "1"
		create_an_animal_local($totally_legit_shelter)
	when "2"
		create_a_client_local($totally_legit_shelter)
	when "3"
		view_list_of_animals_local($totally_legit_shelter)
	when "4"
		view_list_of_clients_local($totally_legit_shelter)
	when "5"
		adoption_local($totally_legit_shelter)
	when "6"
		up_for_adoption_local($totally_legit_shelter)
	end
end