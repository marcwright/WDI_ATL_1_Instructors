require 'pry'
require_relative "animal.rb"
require_relative "client.rb"
require_relative "shelter.rb"

#Iterate through arrays, put each item to screen.
def list(array)
  array.each do |x|
    puts x
  end
end

#Answer questions with input
def answer(question)
  puts question
  answer = gets.chomp
end

menu_options = ["1. Create an animal.", "2. Create a client.", "3. Display all animals.", "4. Display all clients.", "5. Adopt an animal.", "6. Put an animal up for adoption.", "7. Quit."]
puts "Welcome to the animal shelter app.  Please chose one of the following options:"
list(menu_options)
choice = gets.chomp

while choice != "7"
  case choice
    when "1" then create_animal()
    when "2"
    when "3" then list(animals)
    when "4" then list(clients)
    when "5"
    when "6"
  end
end
