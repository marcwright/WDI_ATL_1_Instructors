
class Shelter
  def initialize(name, animals)
    @shelter_name = name
    @animals = []
    @clients = []
  end

  def name
    return @name
  end

  def name=(name)
    @name = name
    return @name
  end

  def add_animal(name, species)
    @animals << Animal.new(name, species)
    return @animals
  end

# add client and their pet to the shelter
  def add_client(client_name, animal_name, age, species)
    @animals << Animal.new(animal_name, species)
    @clients << Client.new(client_name, age)
    return @clients
  end

def prints_clients_names
    @clients.each do |client|
      puts "#{@clients.index(client)+1} #{client.name}"
    end
  end

  def prints_animals_names
    @animals.each do |animal|
      puts "#{@animals.index(animal)+1} #{animal.name} - #{animal.species}"
    end
  end

  def adopt(animal, client)
    puts "#{@animals[animal].name} was adopted!"
    @animals.delete_at(animal)
    binding.pry
    @clients[client].adopt_pet(animal)
  end

  def return(animal, client)
    @animals.push(animal)
    @clients[client].return_pet(animal)
    puts "#{@animals[animal].name} was returned!"

  end
end

# shelter_1.prints_clients_names
# shelter_1.prints_animals_names
# shelter_1.return_animal("Kitty")
# A shelter should have a name
# A shelter can have multiple animals, but it doesn't start with any.
# A shelter can have multiple clients, but it doesn't start with any.
# A shelter should be able to display all of its clients.
# A shelter should be able to display all of its animals.
# A shelter should be able to facilitate an adoption (one of its clients adopting one of the animals from shelter)
# A shelter should be able to facilitate a return (one of its clients returning his/her pet to the shelter)
