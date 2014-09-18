require 'Pry'
require_relative "classes/shelter"
require_relative "classes/client"
require_relative "classes/animals"

puts "Welcome to:"
shelter1 = Shelter.new("The Puppy Mill")
puts shelter1.name

# Menu
# +++++++
def menu
  puts "Menu:"
  puts "1. Create an animal"
  puts "2. Create a client"
  puts "3. Print animal roster"
  puts "4. Print client roster"
  puts "5. Adopt an animal"
  puts "6. Quit"
end

# For all answers
# +++++++++++++++++
def get_answer_to(question)
  puts question
  answer = gets.chomp
  return answer
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
    shelter1.adopt
  elsif choice == 6
    break
  end
end
