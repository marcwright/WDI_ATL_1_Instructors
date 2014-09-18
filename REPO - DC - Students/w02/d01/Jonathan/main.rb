require 'Pry'
require_relative "classes/shelter.rb"
require_relative "classes/clients.rb"
require_relative "classes/animals.rb"

# For all answers
# +++++++++++++++++
def get_answer_to(query)
  puts query
  return gets.chomp.downcase
end

puts "Welcome to:"
shelter1 = Shelter.new("The Puppy Mill")
puts shelter1.name
puts

# Menu
# +++++++
def menu
  puts
  puts "Menu:"
  puts "(enter cooresponding menu number)"
  puts
  puts "1. Add an Pet"
  puts "2. Add a Client"
  puts "3. Pet Roster"
  puts "4. Client Roster"
  puts "5. Adopt a Pet"
  puts "6. Drop-off an Animal"
  puts "7. Quit"
end

while true
  menu
  choice = gets.to_i
  if choice == 1
    shelter1.add_animal
  elsif choice == 2
    shelter1.add_client
  elsif choice == 3
    shelter1.print_animals
  elsif choice == 4
    shelter1.print_clients
  elsif choice == 5
    shelter1.adopt_animals
  elsif choice == 6
    shelter1.return_pet
  elsif choice == 7
    break
  end
end

# binding.pry
