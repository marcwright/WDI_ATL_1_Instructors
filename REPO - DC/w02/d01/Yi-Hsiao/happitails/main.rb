require "pry"

require_relative "models/animal"
require_relative "models/client"
require_relative "models/shelter"
require_relative "models/cat_lady"

require_relative "models/seed"

def get_valid_answer(question, valid_answers)
  # checks and validates if user input matches possible answers, 'valid_answers'
  # valid_answers can be an Array of possible answers or a regex string.

  puts question
  user_input = gets.chomp
  puts

  answer = case valid_answers
    # checks if string is a case-insensitive match or if numeric values are equal
    when Array then valid_answers.detect do |possible_answer|
      possible_answer.is_a?(String) ? possible_answer.casecmp(user_input) == 0 : possible_answer == user_input.to_f
    end
    when Regexp then user_input.match(valid_answers) { |match| match[0] }
  end

  if answer
    return answer
  else
    puts "Sorry, I didn't understand you."
    get_valid_answer(question, valid_answers)
  end
end

def get_multi_choice(array_options, question)
  # creates a multiple choice system from an array of options and returns the value that the user picked

  num_options = (1..array_options.length).to_a
  text_list = array_options.each_with_index.map { |item, idx| "#{idx + 1}. #{item}" }
  choice = get_valid_answer("#{question}\n#{text_list.join("\n")}", num_options)
  array_options[choice - 1]
end

def get_user_selection(shelter)
  # quit is always the last option in the menu
  menu = ["Add an animal to the shelter",
    "Add a potential client",
    "Display all animals",
    "Display all clients",
    "Adopt an animal",
    "Put an animal up for adoption",
    "Quit"]

  while true
    menu_selection = get_multi_choice(menu, "Pick a menu option:")
    case menu.find_index(menu_selection)
    when 0 then add_animal_wizard(shelter)
    when 1 then add_client_wizard(shelter)
    when 2 then display_all_animals(shelter)
    when 3 then display_all_clients(shelter)
    when 4 then adopt_pet_wizard(shelter)
    when 5 then return_pet_wizard(shelter)
    when 6 then break
    end
    puts # adds a line break to chunk up user actions visually
  end
end

def add_animal_wizard(shelter)
  name = get_valid_answer("What is the animal's name?", /.+/).split.map(&:capitalize).join(" ")
  species = get_valid_answer("What is #{name}'s species?", /.+/)
  shelter.add_animal(name, species)
end

def add_client_wizard(shelter)
  name = get_valid_answer("What is the client's name?", /.+/).split.map(&:capitalize).join(" ")
  age = get_valid_answer("What is the #{name}'s age?", /.+/)
  shelter.add_client(name, age)
end

def display_all_animals(shelter)
  if shelter.animals.length > 0
    puts "Here are all our shelter's available pets:"
    puts "* " + shelter.animals.join("\n* ")
  else
    puts "There are no available pets at this time."
  end
end

def display_all_clients(shelter)
  if shelter.clients.length > 0
    puts "Here are all our shelter's clients:"
    puts "* " + shelter.clients.join("\n* ")
  else
    puts "There are no clients at this time."
  end
end

def adopt_pet_wizard(shelter)
  # assigns a pet to a client and removes the pet from the shelter
  avail_pets = shelter.animals
  avail_clients = shelter.clients

  if avail_pets.length > 0
    adopting_client = get_multi_choice(avail_clients, "Who wants to adopt an animal?")
    adopted_pet = get_multi_choice(avail_pets, "Which animal does #{adopting_client} want to adopt?")

    # check to see if the client can accept the pet before removing it from the shelter
    shelter.adopt_pet(adopted_pet, adopting_client)
  else
    puts "There are no available pets at this time."
  end
end

def return_pet_wizard(shelter)
  # returns pets and adds the pet back to the shelter

  # only clients with pets can return pets
  clients_w_pets = shelter.clients.select { |client| client.pets.length > 0 }

  if clients_w_pets.length > 0
    returning_client = get_multi_choice(clients_w_pets, "Who wants to return an animal?")

    clients_pets = returning_client.pets
    returned_pet = get_multi_choice(clients_pets, "Which animal does #{returning_client} want to return?")

    shelter.return_pet(returned_pet, returning_client)
  else
    puts "There are no clients with pets at this time."
  end
end

get_user_selection($local_shelter)
