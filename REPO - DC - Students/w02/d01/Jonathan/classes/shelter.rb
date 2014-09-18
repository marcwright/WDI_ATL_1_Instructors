# ++++++++++++++++++++++
# Shelter Class
# ++++++++++++++++++++++

class Shelter
  def initialize(name)
    @name = name
    @animals = []
    @clients = []
  end

# Shelter Getters and Setters
# ++++++++++++++++++++++++++++
    def name
      return @name
    end

    def animals
      return @animals
    end

    def clients
      return @clients
    end

    def add_animal
      name = get_answer_to("Animal name?").capitalize
      species = get_answer_to("Species type?")
      new_animal = Animal.new(name, species)
      @animals << new_animal
    end

    def add_client
      name = get_answer_to("Client name?").capitalize
      age = get_answer_to("Client age?").to_i
      new_client = Client.new(name, age)
      @clients << new_client
    end

    def print_animals
      animals.each do |animal|
        puts
        puts "Pets:"
        puts "Pet: #{animal.name}"
        puts "Type: #{animal.species}"
        puts
      end
    end

    def print_clients
      clients.each do |client|
        puts
        puts "Clients:"
        puts "Client: #{client.name}"
        puts "Age: #{client.age}"
        puts
      end
    end

    def adopt_animals
      @animals.each_with_index do |animal, index|
      puts "#{index + 1}. Pet: #{animal.name}, Species: #{animal.species}"
    end
      puts "Enter a cooresponding pet number:"
      owner = gets.chomp.to_i - 1

    @clients.each_with_index do |client, index|
      puts "#{index + 1}. Client: #{client.name}"
    end
    puts"Enter a cooresponding client number:"

    candidate = gets.chomp.to_i - 1

    if @clients[owner].pets.length < 2
      @clients[owner].add_pet(@animals[candidate])
      @animals.delete_at(candidate)

      puts "#{@clients[owner].name} has adopted #{@clients[owner].pets.last}"
    else
      puts "Client has already adopted a Puppy Mill pet"
    end

    def return_pet
      @clients.each_with_index do |client, index|
        puts "#{index + 1}. Client: #{client.name}"
    end
    puts "Dropping of Animal:"
    puts "Enter a corresponding client number:"
    dropping_client = gets.chomp.to_i - 1

    @clients[dropping_client].pets.each_with_index do |pet, index|
      puts "#{index +1}. Pet: #{pet.name}, Species: #{pet.species}"
    end

    puts "Animal Drop-off:"
    puts "Enter the corresponding number of the animal to be dropped-off:"
    dropped_pet = gets.chomp.to_i - 1
    @animals.push(@clients.pets[dropped_pet])
    @clients.pets.delete_at(dropped_pet)

    puts "#{@clients[dropping_client].name} has completed the drop-off of #{animals.last.name}"

    end # return_pet

  end # Initialize

end #Shelter


