# require 'pry'

require_relative 'models/animal'
require_relative 'models/client'
require_relative 'models/shelter'
require_relative 'models/seeds'


# Adds clients and animals
$happi_tails.clients_list.push($sammy)
$happi_tails.clients_list.push($donald)
$happi_tails.clients_list.push($rachel)
$happi_tails.clients_list.push($daffy)

$happi_tails.animals_list.push($meeko)
$happi_tails.animals_list.push($pluto)
$happi_tails.animals_list.push($bugs)
$happi_tails.animals_list.push($fluffy)
$happi_tails.animals_list.push($spot)

# Helpful Methods

def get_answer_to(question)
  puts ""
  puts question
  answer = gets.chomp
  return answer
end


# Menu

def menu_options
  puts ""
  puts "Enter a NUMBER from the following list of actions:"
  puts "1. Create an animal"
  puts "2. Create a client"
  puts "3. Display all animals"
  puts "4. Display all clients"
  puts "5. Adopt an animal"
  puts "6. Put an animal up for adoption"
  puts "7. Quit"
  puts ""
end

answer = "0"

while answer != "7"
  menu_options
  answer = gets.chomp
  case answer
  when "1"
    $happi_tails.add_animal

  when "2"
    $happi_tails.add_client

  # Displays all animals
  when "3"
    $happi_tails.list_animals


  # Displays all clients
  when "4"
    $happi_tails.list_clients

  when "5"
    puts ""
    puts "Here are the animals available for adoption:"
    $happi_tails.list_animals
    $happi_tails.adopt_animal

  when "6"

    $happi_tails.return_animal


  when "7"
    puts "Thanks, and goodbye!"
  else
    puts "You didn't enter a valid selection."
  end

end

# binding.pry

