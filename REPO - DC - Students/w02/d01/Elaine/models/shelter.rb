class Shelter
  def initialize(name)
    @name = name
    @animals = ''
    @clients = ''
    @animals_list = []
    @clients_list = []
  end

  def name
    return @name
  end

  def animals
    return @animals
  end

  def clients
    return @clients
  end

  def animals_list
    return @animals_list
  end

  def animals_list=(animals_list)
    @animals_list = animals_list
  end

  def clients_list
    return @clients_list
  end

  def clients_list=(clients_list)
    @clients_list = clients_list
  end


  # Add an animal
  def add_animal
    animal_name = get_answer_to("What's the animal's name?")
    animal_species = get_answer_to("What's the species?")
    new_animal = Animal.new(animal_name, animal_species)
    @animals_list.push(new_animal)
  end

  # Add a client
  def add_client
    client_name = get_answer_to("What's the client's full name?")
    client_age = get_answer_to("How old is the client?")
    new_client = Client.new(client_name, client_age)
    @clients_list.push(new_client)
  end

  # List animals
  def list_animals
    @animals_list.each_with_index do |animal, index|
      puts "#{index + 1}) #{animal.name} is a #{animal.species}."
    end
    # Returning nil to avoid terminal output of entire array
    return nil
  end

  # List clients
  def list_clients
    @clients_list.each_with_index do |client, index|
      if client.pets == []
        puts "#{index + 1}) #{client.name} is #{client.age} years old and has no pets."
      else

        puts "#{index + 1}) #{client.name} is #{client.age} years old and has #{client.pets.length} pet(s):"
        client.pets.each do |pet|
          puts "#{pet.name} the #{pet.species}"
        end
      end
    end
    # Returning nil to avoid terminal output of entire array
    return nil
  end

  # Facilitates adoption
  def adopt_animal
    puts ""
    puts "Enter the number of animal you would like to adopt."
    adoption = gets.to_i
    index_number = adoption - 1

    pet = self.animals_list[index_number]
    animals_list.delete_at(index_number)

    puts ""
    puts "Enter your client number:"
    self.list_clients

    adopter_index = gets.to_i - 1

    adopter = self.clients_list[adopter_index]

    adopter.add_pet(pet)

    puts ""
    self.list_clients

  end

  # Facilitates putting up an animal for adoption
  def return_animal
    puts ""
    puts "Enter your client number:"
    self.list_clients

    returner_index = gets.to_i - 1

    returner = self.clients_list[returner_index]

    puts ""
    puts "Enter the number of the pet you would like to return:"

    returner.pets.each_with_index do |pet, index|
      puts "#{index + 1}) #{pet.name} the #{pet.species}"
    end

    returned_pet_index = gets.to_i
    index_num = returned_pet_index - 1

    pet = returner.pets[index_num]

    animals_list.push(pet)

    returner.return_pet(pet)

    puts ""
    self.list_clients

  end

end
