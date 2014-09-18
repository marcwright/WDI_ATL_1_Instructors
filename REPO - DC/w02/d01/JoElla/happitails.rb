require "pry"
require_relative 'models/animal'
require_relative 'models/client'
require_relative 'models/shelter'

critter_farm = Shelter.new("CritterFarm")

def menu
  puts ""
  puts "Enter the number for the options below:"
  puts ""
  puts "1. Create an animal"
  puts "2. Create a client"
  puts "3. List all animals"
  puts "4. List all the clients"
  puts "5. Adopt a pet!"
  puts "6. Return a pet :("
  puts "7. Quit"
end

def new_animal(name, species, shelter)
  animal = Animal.new(name, species)
  shelter.add_animals(animal)
end

def new_client(name, age, shelter)
  client = Client.new(name, age)
  shelter.add_clients(client)
end

def get_input(question)
  puts question
  answer = gets.chomp
  return answer
end

steve_dave = new_client("Steve Dave", 30, critter_farm)
fido = new_animal("Fido", "dog", critter_farm)


choice = "arbitrary string!"
while choice != 7
  menu
  choice = gets.chomp.to_i
  case choice
  when 1
    #create an animal
    animal_name = get_input("What's the name of the new animal?")
    animal_species = get_input("What kind of animal is it?")
    new_animal(animal_name, animal_species, critter_farm)

  when 2
    #create a client
    client_name = get_input("What's the new client's name?")
    client_age = get_input("How old is the new client?")
    new_client(client_name, client_age, critter_farm)

  when 3
    #list all the animals in critter_farm
    critter_farm.list_animals
  when 4
    #list all the clients
    critter_farm.list_clients
  when 5
    #adoption
    puts "Type the number for the adopting client"
    critter_farm.list_clients
    adopter_index = gets.chomp.to_i - 1
    puts "Type the number for the adoptee animal"
    critter_farm.list_animals
    adoptee_index = gets.chomp.to_i - 1
    critter_farm.adoption(adopter_index, adoptee_index)

    # array[adoptee] << array[adopter]

  when 7
    choice = 7
  else
    puts "Numbers only, pleez."
  end
end



binding.pry
