# Stephen Stanwood (stephen@stanwoodsolutions.com)

require 'pry'

require_relative "models/Animal.rb"
require_relative "models/Client.rb"
require_relative "models/Shelter.rb"
require_relative "models/CatLady.rb"
require_relative "seeds.rb"

def header
  puts "### Welcome to #{$s.name}! ###\n"
end

# Indicates whether a string picks one of the valid options (a, c, or q)
def is_valid_option(input)
  first = input.chars.first.downcase
  return (first == 'a' || first == 'c' || first = 'q')
end

# Prompts a user until he/she makes a valid choice, then returns that choice
def prompt_option
  options = ["create an (a)nimal", "create a (c)lient", "(d)isplay all animals", "display all c(l)ients", "ado(p)t", "(r)eturn", "(q)uit:"]

  while true
    print "What to do? You can: \n** " + options.join("\n** ") + " \n\n...? "
    resp = gets.chomp
    return resp if is_valid_option(resp)
  end
end

# Allows the user to create an animal, then adds it to the shelter
def create_animal
  print "==> What's the animal's name? "
  name = gets.chomp.downcase
  print "==> What's the animal's species? "
  species = gets.chomp.downcase
  $s.add_pet(Animal.new(name, species))
end

# Allows the user to create a client, then adds him/her to the shelter
def create_client
  print "==> What's the client's name? "
  name = gets.chomp.downcase
  print "==> What's the client's age? "
  age = gets.chomp.to_i
  $s.add_client(Client.new(name, age))
end

def prompt_animal
  $s.display_animals
  while true
    print "==> Which animal (name)? "
    resp = gets.chomp.downcase
    a = $s.animals.select { |a| a.name == resp }
    if a.size > 0
      return a.first
    end
  end
end

def return_prompt(client)
  if client.pets.size == 0
    puts "#{client.name.capitalize} has no pets!"
    return nil
  end

  puts "#{client.name.capitalize}'s pets: " + client.pets.join(", ") + "\n"
  while true
    print "==> Return which animal (name)? "
    resp = gets.chomp.downcase
    p = client.pets.select { |a| a.name == resp }
    if p.size > 0
      return p.first
    end
  end
end

def prompt_client
  $s.display_clients
  while true
    print "==> Which client (name)? "
    resp = gets.chomp.downcase
    c = $s.clients.select { |c| c.name == resp }
    if c.size > 0
      return c.first
    end
  end
end

header

while true
  resp = prompt_option
  puts
  case resp
  when "a"
    create_animal
  when "c"
    create_client
  when "d"
    $s.display_animals
  when "l"
    $s.display_clients
  when "p"
    $s.adopt(prompt_animal, prompt_client)
  when "r"
    client = prompt_client
    $s.return(client, return_prompt(client))
  else
    break
  end
  puts
end
