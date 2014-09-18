require "pry"
require_relative "methods/shelter"
require_relative "methods/client"
require_relative "methods/animal"

#for semantic gathering of user input
def get_answer_to(question)
  puts question
  answer = gets.chomp
  return answer
end

#seeds, this works in main but not separate file?
shelter_one = Shelter.new("Sacred Heart")
new_animal_one = Animal.new("Bob", "cheetah")
new_animal_two = Animal.new("John", "horse")
new_animal_three = Animal.new("Joe", "monkey")
shelter_one.add_initial_animal(new_animal_one)
shelter_one.add_initial_animal(new_animal_two)
shelter_one.add_initial_animal(new_animal_three)
new_client_one = Client.new("Carol", "43")
new_client_two = Client.new("Randal", "54")
new_client_three = Client.new("Hosea", "28")
shelter_one.add_initial_client(new_client_one)
shelter_one.add_initial_client(new_client_two)
shelter_one.add_initial_client(new_client_three)

  def list_options
    puts ""
    puts "Enter the NUMBER from the list of actions below:"
    puts ""
    puts "1. Add new animal"
    puts "2. Add new client"
    puts "3. Display all animals"
    puts "4. Display all clients"
    puts "5. Adopt an animal"
    puts "6. Quit"
    puts ""
  end

answer = "abitrary string!"

while answer != "6"
  list_options
  answer = gets.chomp
  case answer
  when "1"
    shelter_one.add_animal
  when "2"
    shelter_one.add_client
  when "3"
    shelter_one.display_all_animals
  when "4"
    shelter_one.display_all_clients
  when "5"
    client = shelter_one.select_client
    animal = shelter_one.select_animal
    client.add_pet(animal)
  else
  end
end

