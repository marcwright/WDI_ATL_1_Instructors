require_relative "Shelter.rb"
require_relative "Animal.rb"
require_relative "Client.rb"
require_relative "seeds.rb"

in_operation = true

while in_operation == true
  puts "Welcome to Happitails!"
  puts "Menu:"
  puts "(1) Create an animal"
  puts "(2) Create a client"
  puts "(3) Display all animals"
  puts "(4) Display all clients"
  puts "(5) Adopt a pet?"
  puts "(6) Return a pet?"
  puts "(q) Quit"
  answer = gets.chomp

  case answer
  when "1"
    puts "What is the animal's name?"
    pet_name = gets.chomp
    puts "What is the animal's species?"
    species = gets.chomp
    $happitails.add_animal(pet_name, species)
  when "2"
    puts "What is the client's name?"
    client_name = gets.chomp
    puts "What is the client's age?"
    client_age = gets.chomp
    $happitails.add_client(client_name, client_age)
  when "3"
    $happitails.return_animals
  when "4"
    $happitails.return_clients
  when "5"
    puts "Is the client in the database? (Y/N)"
    yesno = gets.chomp.downcase
    if yesno == "y"
      $happitails.adopt

    else
      puts "What is the client's name?"
      name = gets.chomp
      puts "What is the client's age?"
      age = gets.chomp
      $happitails.add_client(name, age)
      $happitails.adopt
    end
  when "6"
    puts "Aww, but your pet is so cute."
    $happitails.unadopt
  when "q"
    in_operation = false
  end
end

