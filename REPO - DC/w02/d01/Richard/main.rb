
require 'pry'
require_relative 'models/animal'
require_relative 'models/client'
require_relative 'models/shelter'
require_relative 'models/seeds'

animals_in_shelter = []
clients_of_shelter = []
pets = []


#   new_shelter = Shelter.new("Wags and Tags")
#   animal_1 = Animal.new("Romeo", "Dog", 15)
#   puts animal_1.animal_name
#   animal_2 = Animal.new("Rascal", "Cat", 24)
#   client_1 = Client.new("Richard Hessler", 26, animal_1)
#   client_2 = Client.new("Sara Hessler", 25, animal_2)

  $new_shelter.add_initial_animal($animal_1)
  $new_shelter.add_initial_animal($animal_2)
  $new_shelter.add_initial_client($client_1)
  $new_shelter.add_initial_client($client_2)

def list_options
  puts ""
  puts "Enter the NUMBER for the action you'd like to perform"
  puts ""
  puts "1.) Create and animal (weird, sounding, I know - go with it.)"
  puts "2.) Play god - Create a client"
  puts "3.) Display all animals in the shelter."
  puts "4.) Display all clients in database."
  puts "5.) Adopt a pet."
  puts "6.) Put pet up for adoption."
  puts "7.) Quit"
  puts ""
end

answer = ""

while answer != '7'
  list_options
  answer = gets.chomp
  case answer
  when '1'
    puts "Great, lets 'create' an animal:"
    $new_shelter.animals_in_shelter << $new_shelter.add_new_animal
    puts $new_shelter.animals_in_shelter[0].animal_name
  when '2'
    puts "Oh! A New Client! Let's get you documented!"
    $new_shelter.clients_of_shelter << $new_shelter.add_new_client
     puts $new_shelter.clients_of_shelter[0].client_name
  when '3'
    $new_shelter.list_animals_in_shelter
  when '4'
    $new_shelter.list_clients_of_shelter
  when '5'
    puts "Who are you?"
    $new_shelter.adopt_animal
  when '6'
    puts "Leaving animals!? ok D:"
    $new_shelter.drop_animal
  else
    puts "Goodbye!"
  end
end
