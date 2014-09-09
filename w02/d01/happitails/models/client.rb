class Client
  attr_accessor :name, :age
  attr_reader :pets
  
  def initialize(name, age)
    @name = name
    @age = age
    @pets = []
  end

  def add_pet(pet)
    pets << pet
  end
end
