require 'pry'

require_relative './Client'
require_relative './Shelter'
require_relative './Animals'
require_relative './Seeds'


# Birth of shelter --> instnace
shelter = Shelter.new("HappiTails")

animal_1 = Animals.new("BooRay", "dog")
animal_2 = Animals.new("Spot", "dog")
animal_3 = Animals.new("Dan", "cat")
shelter.add_initial_animal(animal_1)
shelter.add_initial_animal(animal_2)
shelter.add_initial_animal(animal_3)

client_1 = Clients.new("Betsy", "27")
client_2 = Clients.new("Dawson", "55")
shelter.add_initial_client(client_1)
shelter.add_initial_client(client_2)

#============================#
#======Helper Variables======#
#============================#

# Gathers input for menu
def get_answer_to(question)
  puts question
  answer = gets.chomp
  return answer
end

#============================#
#============Menu============#
#============================#

def menu_options
  puts ""
  puts "HappiTails v1.0, Copyright 1993"
  puts ""
  puts "Enter the NUMBER from the list of actions below:"
  puts " "
  puts "1. Add animal to shelter"
  puts "2. Add client"
  puts "3. Display animals in shelter"
  puts "4. Display shelter clients"
  puts "5. Client adopts pet"
  puts "6. Client places pet up for adoption"
  puts "7. Quit"
  puts " "
end

answer = "arbitrary string!"

while answer != '7' #String or integer?
  menu_options
  answer = gets.chomp
  case answer
  when '1'
    puts "Please enter the following information about the new animal:"
    shelter.add_animal()
  when '2'
    puts "Please enter the new client\'s name:"
    shelter.add_client()
  when '3'
    puts "Inventory of HappiTails animals:"
    shelter.disp_animals()
  when '4'
    puts "Client list:"
    shelter.disp_clients()
  when '5'
    shelter.adopt_pet()
  when '6' # This is as far as I could get
    puts "Placeholder"
  when '7'
    puts " "
    puts "Exiting..."
    puts " "
  else
    puts "Invalid entry"
  end

end

