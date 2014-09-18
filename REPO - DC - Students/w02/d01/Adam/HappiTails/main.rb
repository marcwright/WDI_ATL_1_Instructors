require 'pry'

require_relative 'animal'
require_relative 'client'
require_relative 'shelter'

animal_array = []
client_array = []

#=======================
# Helper Methods and initial variables
#=======================

# for semantic gathering of user input
def get_answer_to(question)
  puts question
  answer = gets.chomp
  return answer
end

# list all animals
def list_animals(animals)
  animals.each_with_index do |animals, index|
    puts "List of animals: #{animals.name}"
  end
  return nil
end

# list all clients
def list_clients(clients)
  clients.each_with_index do |clients, index|
    puts "#{index + 1}: #{clients.name}"
  end
  return nil
end

# for use when user adds an animal
def add_animal(animal_array)
  name = get_answer_to("What's the name of the animal?")
  species = get_answer_to("What is the species of animal?")
  animal = Animal.new(name, species)
  animal_array << animal
  puts ""
  puts "Great. You've added #{animal.name} to your collection of animals."
end

# for use when user adds a client
def add_client(client_array)
  name = get_answer_to("What is the name of the client?")
  age = get_answer_to("What is the age of the client?")
  client = Client.new(name, age)
  client_array << client
  puts ""
  puts "Great. You've added #{client.name} to your collection of clients."
end

#=======================
# Seed Data (objects at start of program)
#=======================
animal_1 = Animal.new("Emma", "dog")
animal_2 = Animal.new("Lucy", "cat")
animal_array << animal_1
animal_array << animal_2


#=======================
# Menu and Program Flow
#=======================

def list_options
  puts ""
  puts "I've created a new shelter for you. Enter the NUMBER from the list of actions below:"
  puts ""
  puts "1. Create an animal"
  puts "2. Create a client"
  puts "3. Display all animals"
  puts "4. Display all clients"
  puts "5. Quit"
  puts ""
end

answer = 'arbitrary string!'

while answer != '5'
  list_options
  answer = gets.chomp
  case answer
  when '1'
    add_animal(animal_array)
  when '2'
    add_client(client_array)
  when '3'
    list_animals(animal_array)
  when '4'
    list_clients(client_array)
  when '5'
    puts 'Thanks for playing!'
  else
    answer = '5'
    puts 'Thats not an option bro.'
  end
end






binding.pry
