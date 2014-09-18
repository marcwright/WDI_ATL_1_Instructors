require 'pry'

# here we bring in all the model code that we'll need
require_relative 'models/animal'
require_relative 'models/client'
require_relative 'models/shelter'
require_relative 'seeds'

#===============================
# helper methods
#===============================

def get_answer_to(question)
  puts question
  answer = gets.chomp
end

#==================================================
# Menu
#==================================================
answer = 42

# while loop that executes until the user quits
while answer != "7"
  puts ""
  puts "What would you like to do? (Choose Number)"
  puts "1. Create an Animal"
  puts "2. Create a Client"
  puts "3. Display all animals"
  puts "4. Display all clients"
  puts "5. Facilitate adoption"
  puts "6. Facilitate abandonment"
  puts "7. Quit"
  puts ""
  answer = gets.chomp.strip

  case answer
  when "1"
    $happitails.add_animal
  when "2"
    $happitails.add_client
  when "3"
    puts `clear`
    puts "Here are the names of all your animals:"
    puts ""
    $happitails.display_all_animals
  when "4"
    puts `clear`
    `say here are all of your clients`
    puts "Here are the names of all your clients:"
    puts ""
    $happitails.display_all_clients
  when "5"
    $happitails.facilitate_adoption
  when "6"
    $happitails.facilitate_abandonment
  else
    puts "Your input was invalid"
  end
end

