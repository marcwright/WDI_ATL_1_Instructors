require 'pry'

require_relative 'animal.rb'
require_relative 'client.rb'
require_relative 'shelter.rb'
require_relative 'seeds.rb'

def prompt_user(query)
  puts query
  return gets.chomp.downcase
end

puts "Welcome to #{$fosters.name}!"
while true
  puts "You may create an [animal], create a [client], display all [animals], display all [clients], [adopt] an animal, put an animal up for [adoption] or [quit]."
  input = prompt_user("What would you like to do?")
  break if input == "quit"

  case input
  when "animal"
    $fosters.add_animal
  when "client"
    $fosters.add_client
  when "animals"
    puts "We currently hold #{$fosters.animals.join(", ")}."
  when "clients"
    puts "We currently work with #{$fosters.clients.join(", ")}."
  when "adopt"
    $fosters.adopt_animal
  when "adoption"
    $fosters.return_animal
  else
    puts "That is not a valid option."
  end

end

puts "Goodbye!"
