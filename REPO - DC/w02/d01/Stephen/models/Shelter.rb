# Stephen Stanwood (stephen@stanwoodsolutions.com)

class Shelter
  attr_accessor :name, :animals, :clients

  def initialize
    @name = "HappiTails"
    @animals = []
    @clients = []
  end

  def display_clients
    puts "Client list:\n** #{@clients.join("\n** ")}"
  end

  def display_animals
    puts "Animal list:\n** #{@animals.join("\n** ")}"
  end

  # Adds a specified pet to the shelter
  def add_pet(animal)
    @animals.push(animal)
  end

  # Adds a specified client to the shelter
  def add_client(client)
    @clients.push(client)
  end

  def adopt(animal, client)
    if client.class.name == "CatLady"
      if animal.species.downcase != "cat"
        puts "I DON'T TAKE NON-CATS!!!"
      else
        @animals.delete(animal)
        client.adopt(animal)
      end
    elsif (client.pets.size >= 2)
      puts "Can't adopt--#{client.name} already has two pets!"
    else
      @animals.delete(animal)
      client.adopt(animal)
    end
  end

  def return(client, animal)
    if (animal != nil)
      client.return(animal)
      @animals.push(animal)
    end
  end
end
