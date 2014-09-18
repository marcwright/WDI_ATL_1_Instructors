require "pry"
require_relative "animal"
require_relative "shelter"
require_relative "client"

ga_shelter = Shelter.new("GA")

def gets_input(prompt)
  puts prompt
  answer = gets.chomp
  return answer
end

def create_animal
  name = gets_input("What is the pet's name?")
  species = gets_input("What is #{name}'s species?")
  toys = gets_input("How many toys does this pet have?")
  new_animal = Animal.new(name, species)
  new_animal.add_toys(toys)
  return new_animal
end

def create_client
  count = 0
  name = gets_input("What is your name?")
  age = gets_input("How old are you?")
  pets = gets_input("How many pets do you have?").to_i
  if (pets) > 0
    new_client = Client.new(name, age)
    while count < pets
      new_client.add_pets(create_animal)
      count += 1
    end
    return new_client
  else
    new_client = Client.new(name, age)
    return new_client
  end
end


def main_menu
  puts "Welcome to the GA shelter!"
  puts "-->(1) to Create an Animal"
  puts "-->(2) to Create a Client"
  puts "-->(3) to List all the Animals"
  puts "-->(4) to List all the Clients"
  puts "-->(5) to Adopt an Animal"
  puts "-->(6) to Return an Animal"
  puts "-->(7) to Quit"
  print "--> "
end

answer = "Wooooooo"

while answer != "7"
  main_menu
  answer = gets.chomp
  case answer
  when "1"
   ga_shelter.add_animal(create_animal)
  when "2"
    ga_shelter.add_client(create_client)
  when "3"
    ga_shelter.disp_animals
  when "4"
    ga_shelter.disp_clients
  when "5"
    client = ga_shelter.choose_client
    animal = ga_shelter.adopt_animal
    client.add_pets(animal)
  # when "6"
  #   ga_shelter.disp_clients
  when "7"
    break
  else
    puts "Please try again."
  end
end




