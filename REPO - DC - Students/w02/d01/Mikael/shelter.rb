class Shelter
  def initialize(name="")
    @name = name
    @animals = []
    @clients = []
  end

  def name
    return @name
  end

  def clients
    return @clients
  end

  def animals
    return @animals
  end

  def add_client
    name = prompt_user("What is the client's name?").downcase
    age = prompt_user("How old is the client?")
    client = Client.new(name, age)
    @clients.push(client)
    puts "You created #{client.name.capitalize}."
  end

  def add_animal
    name = prompt_user("What is the animal's name?").downcase
    species = prompt_user("What species of the animal?").downcase
    animal = Animal.new(name, species)
    @animals.push(animal)
    puts "You created #{animal.name.capitalize} the #{animal.species.capitalize}."
  end

  def adopt_animal
    @animals.each_with_index do |animal, i|
    puts "Animal #{i + 1}: #{animal.name} the #{animal.species}"
    end
    adoptee = prompt_user("Please enter the number of the animal you would like to adopt.").to_i - 1

    @clients.each_with_index do |client, i|
      puts "Client #{i + 1}: #{client.name}"
    end
    adopter = prompt_user("Please enter the number of the client who is adopting this animal.").to_i - 1

    if @clients[adopter].pets.length < 2
      @clients[adopter].add_pet(@animals[adoptee])
      @animals.delete_at(adoptee)

      puts "#{@clients[adopter].name} adopted #{@clients[adopter].pets.last}!"
    else
      puts "That client already has 2 pets!"
    end
  end

  def return_animal
    @clients.each_with_index do |client, i|
      puts "Client #{i + 1}: #{client.name}"
    end
    rejecter = prompt_user("Please enter the number of the client who is  putting an animal up for adoption.").to_i - 1

    @clients[rejecter].pets.each_with_index do |pet, i|
      puts "Pet #{i + 1}: #{pet.name} the #{pet.species}"
    end
  rejectee = prompt_user("Please enter the number of the animal that is being returned to the shelter.").to_i - 1
  @animals.push(@clients.pets[rejectee])
  @clients.pets.delete_at(rejectee)


  puts "#{@animals.last.name} was returned to the shelter. #{@clients[rejecter].name} no longer owns this pet."
  end
end
