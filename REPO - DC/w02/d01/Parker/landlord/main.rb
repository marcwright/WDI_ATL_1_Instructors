require 'pry'
require_relative "animal.rb"
require_relative "client.rb"
require_relative "shelter.rb"

#user input 
def get_answer_to(question)
	puts question
	answer = gets.chomp
	return answer
end

#==========================================
# Seed Data (Instantiated objects to give our program stuff to play with out of the box)
#==========================================
ani_1 = Animal.new("Lou", "Flea", "Hair")
ani_2 = Animal.new("Ralph", "Dog", "Toy")
cli_1 = Client.new("Travis Wick", 22, "Willis")
cli_2 = Client.new("Amber Hicks", 23, "Jones")
she_1 = Shelter.new("Wicks", "Rudy", "Fella")
she_2 = Shelter.new("Rainbow", "Angus", "Goffer")

#=============================
#MENU AND PROGRAM CONTROL FLOW
#=============================


def list_options
  puts ""
  puts "Enter the NUMBER from the list of actions below:"
  puts ""
  puts "1. List all shelters"
  puts "2. View shelters details"
  puts "3. Add an animal to a client"
  puts "4. Add an animal to the shelter"
  puts "5. Quit"
  puts ""
end

answer = "abitrary string!"

while answer != '5'
  list_options
  answer = gets.chomp
  case answer
  when '1'
    list_shelter(shelter)
  when '2'
    puts "Which shelter would you like to view?.)"
    list_shelter(shelter)
    index_of_she_to_view = gets.chomp.to_i - 1
    shelter[index_of_she_to_view].print_details
  when '3'
    add_animmal_name(animal_name)
  when '4'
    puts "What kind of animal would you like to add? (Choose a number.)"
    list_animals(animal_name)
    index_of_which_ani_to_add_to = gets.chomp.to_i - 1
    animal_name[index_of_which_ani_to_add_to].add_animmal_name
  when '5'
    puts "Until next time"
  else
    puts "You didn't provide a valid response."
  end
end



