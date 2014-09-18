class Client
  def initialize(name, age)
    @name = name
    @age = age
    @pets = []
  end

  def name
    return @name
  end

  def age
    return @age
  end

  def pets
    return @pets
  end

  def add_pet(pet)
    self.pets.push(pet)
  end

  def return_pet(pet)
    self.pets.delete(pet)
  end

end
