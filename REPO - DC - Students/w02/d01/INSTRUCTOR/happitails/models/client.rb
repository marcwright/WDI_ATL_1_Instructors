class Client

  def initialize(name, age)
    @name = name
    @age = age
    @pets = []
  end

  def name
    @name
  end

  def pets
    @pets
  end

  def add_pet(pet)
    pets << pet
  end
end
