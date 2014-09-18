class Shelter

  def initialize(name)
    @name = name
    @animals = []
    @clients = []
  end

  def animals
    @animals
  end

  def clients
    @clients
  end

  # a shelter should be able to display all of its clients
  def display_all_clients
    clients.each_with_index do |client, index|
      puts "Client ##{index + 1}. #{client.name.capitalize}"
    end
  end

  # a shelter should be able to display all of its animals
  def display_all_animals
    animals.each_with_index do |animal, index|
      puts "Animal ##{index + 1}. #{animal.name}"
    end
  end

  def add_animal
    name    = get_answer_to("What's the animal's name?")
    species = get_answer_to("What species is the animal?")
    new_animal = Animal.new(name, species)
    animals << new_animal
  end

  def add_client
    name = get_answer_to("What's the new client's name?")
    age  = get_answer_to("What's the new client's age?")
    new_client = Client.new(name, age)
    clients << new_client
  end

  # a shelter should be able to facilitate an adoption of one of its animals by one of its clients
  def facilitate_adoption
    puts "Choose the adopting client by their number."
    display_all_clients
    adopting_client_index = gets.chomp.to_i - 1
    adopting_client = clients[adopting_client_index]
    puts "Choose the animal #{adopting_client.name} wants to adopt."
    display_all_animals
    animal_index = gets.chomp.to_i - 1
    animal = animals[animal_index]
    # I want to give the animal to the client, and remove the animal from the shelter
    adopting_client.add_pet(animal)
    animals.delete_at(animal_index)
    puts "Great, #{adopting_client.name} has given #{animal.name} a new home."
  end

  # a shelter should be able to facilitate a return (one of its clients returning his/her pet to the shelter)
  def facilitate_abandonment
    new_client = get_answer_to("Is the abandoner a new client? (Y/N)").downcase
    if new_client == 'y'
      add_client
      abandoning_client = clients.last
    else
      puts "Choose the adopting client by their number."
      display_all_clients
      abandoning_client_index = gets.chomp.to_i - 1
      abandoning_client = clients[abandoning_client_index]
    end
    add_animal
    puts "Great. #{abandoning_client.name} has given #{animals.last.name} up for adoption."
  end
end
