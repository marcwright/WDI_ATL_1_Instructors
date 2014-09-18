# require_relative 'models/seeds.rb'

class Shelter
  def initialize(shelter_name)
    @shelter_name = shelter_name
    @animals = []
    @clients = []
    @family = []
  end

  #shelter_name getter
  def shelter_name
    return @shelter_name
  end

  #shelter_name setter
  def shelter_name=(shelter_name)
    @shelter_name = shelter_name
    return shelter_name
  end

  #add animal method
  def add_animal
    #get animal name
    animal_name = add_detail("What is the animal name?")
    #get animal species
    species = add_detail("What species is the animal?")
    #add toys
    toys = add_detail("Which toys does the animal have?")
    #add animal info to new_animal
    new_animal = Animal.new(animal_name, species, toys)
    #push animal into animal_array
    animals << new_animal
  end

  #add client method
  def add_client
    #get animal name
    client_name = add_detail("What is the client's name?")
    #get animal species
    age = add_detail("What age of the client?")
    #add toys
    pets = add_detail("What pets does the client have?")
    #add animal info to new_animal
    new_client = Client.new(client_name, age, pets)
    #push animal into animal_array
    clients << new_client
  end

  #show all animals
  def show_all_animals
    @animals.each do |animal|
      puts "#{animal.animal_name} the #{animal.species}"
    end
  end

  #adopt an animal
  def adopt_animal
    puts "Have you already registered as a client? (Y/N)"
    client_confirm = gets.chomp.downcase
    if client_confirm == "y"
      puts "Enter your account number"
        @clients.each_with_index do |client, index|
          puts "(#{index +1}) #{client.client_name}"
        end
        client_index = gets.chomp.to_i
    else
        add_client
    end
    puts "Enter the number of the pet you want"
    @animals.each_with_index do |animal, index|
      puts "(#{index +1}) #{animal.species} #{animal.animal_name}"
    end
    adopt_index = gets.chomp.to_i
    puts "Are you sure? (Y/N)"
    adopt_confirm = gets.chomp.downcase
    if adopt_confirm == "y"
      clients[client_index] << animals[adopt_index]
      puts "Thanks #{client.client_name}, #{animal.animal_name} is now your pet"
    else
    end
  end

  #show all clients
  def show_all_clients
    @clients.each do |client|
      puts "#{client.client_name}"
    end
    # binding.pry
  end

  # #has pet?
  def has_pet?
    @clients.each do |client|
      if pets == "none"
        return true
      else
        return false
      end
    end
  end

  #give away pet
  def give_away_pet
    @clients.each do |give_away|
      animals << client.pets
    end
  end

  #animal getters
  def animals
    return @animals
  end

  def animal_name
    return @animal_name
  end

  def species
    return @species
  end

  def toys
    return @toys
  end

  #client getters
  def clients
    return @clients
  end

  def client_name
    return @client_name
  end

  def age
    return @age
  end

  def pets
    return @pets
  end

  def family
    return @family
  end

end
