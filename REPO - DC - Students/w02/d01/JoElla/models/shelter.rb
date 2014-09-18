
class Shelter
  def initialize(name)
    @name = name
    @animals = []
    @clients = []
  end

  attr_accessor :name
  attr_accessor :clients
  attr_accessor :animals

  def add_clients(name)
    @clients.push(name)
  end

  def add_animals(animal)
    @animals.push(animal)
  end

  def list_animals
    @animals.each_with_index do |animal, index|
    puts "#{index + 1}: #{animal.name} the #{animal.species}"
    end
  end

  def list_clients
    @clients.each_with_index do |client, index|
      puts "#{index + 1}: #{client.name}, age #{client.age}"
    end
  end

  def adoption(adopterindex, adopteeindex)
    #deletes animal from shelter's
    adopted = @animals.delete_at(adopteeindex)
    #pushes animal name to client's array
    #we have the animal object stored in adopted
    #@clients.push(adopted)
    #I think the problem is that the pets array has never been pushed into the client array here
  end




  def return(client, animal)
    #moves animal from the client's array to the given shelter's array
  end

end


