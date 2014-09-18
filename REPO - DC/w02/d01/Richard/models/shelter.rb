class Shelter
  attr_accessor :shelter_nam, :animals_in_shelter, :clients_of_shelter

  def initialize (shelter_name)
    @shelter_name = "Wags with Tags"
    @animals_in_shelter = []
    @clients_of_shelter = []
  end

  def add_initial_animal(animal)
    @animals_in_shelter.push(animal)
  end

  def add_initial_client(client)
    @clients_of_shelter.push(client)
  end

  def answer_me(question)
  puts question
  answer = gets.chomp
  return answer
  end

  def add_new_animal
    animal_name = answer_me("What's the animal's name?")
    species     = answer_me("What is the animal's species?")
    has_toys    = answer_me("How many toys does the animal have?")
    new_animal = Animal.new(animal_name, species, has_toys)
    puts ""
    puts "Hopefully we can find #{animal_name} and home soon."
    puts "Here is a current list of all the animals waiting for a home:"
    puts ""
      return new_animal
  end

  def add_new_client
    client_name = answer_me("What is your first and last name?")
    age         = answer_me("How old are you?")
    pets        = []
    puts "Do you currently have any pets?"
    yes_no_pets = gets.chomp
      if yes_no_pets.downcase.include? 'y'
        new_client = Client.new(client_name, age, pets)
        new_client.pets << add_client_animal
        puts "Great! #{new_client.client_name}, you and #{$new_shelter.new_client.pets[0]} have been added to our database!"
      else
        new_client = Client.new(client_name, age, pets=[])
      end
    return new_client
  end

  def add_client_animal
    animal_name = answer_me("What's the animal's name?")
    species     = answer_me("What is the animal's species?")
    has_toys    = answer_me("How many toys does the animal have?")
    new_pet     = Animal.new(animal_name, species, has_toys)
      return new_pet
  end

  def list_animals_in_shelter#(animals_in_shelter)
    self.animals_in_shelter.each_with_index do |animal, index|
    puts "#{index + 1}.)  #{animal.animal_name} is waiting for a home."
    end
  end

  def list_clients_of_shelter#(clients_of_shelter)
    self.clients_of_shelter.each_with_index do |client, index|
    puts "#{index + 1}.)  #{client.client_name} is a client."
    end
  end

  def adopt_animal
    self.list_clients_of_shelter
    client_index = gets.chomp.to_i - 1
    puts "Great! #{clients_of_shelter[client_index].client_name} which animal would you like to adopt?"
    self.list_animals_in_shelter
    index_of_pet_to_adopt = gets.chomp.to_i - 1
    puts "You've adopted #{$new_shelter.animals_in_shelter[0].animal_name}!"
    clients_of_shelter[client_index].pets << animals_in_shelter.delete_at(index_of_pet_to_adopt)
    binding.pry
  end

  def drop_animal
    puts "Who are you?"
    self.list_clients_of_shelter
    client_index = gets.chomp.to_i
    adopting_client = self.clients_of_shelter[client_index - 1]
    puts "Which pet is to be adopted?"
    self.list_animals_in_shelter
    index_of_pet_to_adopt = gets.chomp.to_i - 1
    up_for_adoption_pet = adopting_client.pets[index_of_pet_to_adopt]
    self.animals_in_shelter << up_for_adoption_pet
    adopting_client.pets.delete_at(index_of_pet_to_adopt)
  end
end
