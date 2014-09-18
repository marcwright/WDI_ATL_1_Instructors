require 'pry'

class Shelter
  attr_accessor :name, :clients, :dogs

  def initialize(name)
    @name = name
    @dogs = {}
    @clients = {}
  end

  def adopt(client_key, dog_key)
    dog_to_adopt = @dogs.delete(dog_key)
    client = @clients[client_key]
    client.dogs[dog_key] = dog_to_adopt
  end

  def abandon(client_key, dog_key)
    client = @clients[client_key]
    dog_to_abandon = client.dogs.delete(dog_key)
    @dogs[dog_key] = dog_to_abandon
  end

end

class Client
  attr_accessor :name, :dogs

  def initialize(name)
    @name = name
    @dogs = {}
  end
end

class Dog
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

shelter = Shelter.new("Battersea")

shelter.dogs["flynn"] = Dog.new("flynn")
shelter.dogs["star"] = Dog.new("star")
shelter.dogs["barley"] = Dog.new("barley")

shelter.clients["michael"] = Client.new("Michael")


binding.pry



















