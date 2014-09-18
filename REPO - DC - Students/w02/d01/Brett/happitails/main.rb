require 'pry'
require_relative 'models/shelter'
require_relative 'models/animals'
require_relative 'models/client'

# It should create a new shelter for you
# It should display a menu of options for the user to choose from:


answer = "blah"
def list_options
  puts ""
  puts "Enter the NUMBER from the list of actions below:"
  puts ""
  puts "1. Create an animal"
  puts "2. Create a client"
  puts "3. Quit"
  puts "4. Display animals in shelter"
  puts "5. Display clients"
  puts "6. Adopt an animal"
  puts "7. Return an animal"
  puts ""
end

while answer != "3"
  list_options
  answer = gets.chomp

  case answer
  when "1"
    puts "What's the animal's name?"
    name = gets.chomp
    puts "What species is it?"
    species = gets.chomp
    fairy_tales.add_animal(name, species)
  when "2"
    puts "What's the client's name?"
    client_name = gets.chomp
    puts "What's the client's age?"
    age = gets.to_i
    puts "What's the name of their animal?"
    animal_name = gets.chomp
    puts "What's the species?"
    species = gets.chomp
    fairy_tales.add_client(client_name, animal_name, age, species)
  when "3"
    "Quitting..."
  when "4"
    fairy_tales.prints_animals_names
  when "5"
    fairy_tales.prints_clients_names
  when "6"
    fairy_tales.prints_clients_names
    puts "Which of the above clients is adopting? (use number)"
    client_name = gets.to_i-1
    fairy_tales.prints_animals_names
    puts "Which animal is being adopted? (Use number)"
    animal_name = gets.to_i-1
    fairy_tales.adopt(animal_name, client_name)


  when "7"
    fairy_tales.prints_clients_names
    puts "Which of the above clients is returning? (user number)"
    client_name = gets.to_i
    client_name.prints_pets_names
    puts "Which animal would you like to return?"
    animal_name = gets.to_i-1
    fairy_tales.return(animal_name, client_name)
  end
end
# When creating an animal or client, the user is prompted for information like names, age etc. Newly created animals and clients should be added to the shelter.
