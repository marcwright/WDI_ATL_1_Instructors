

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

  def print_client
    return "#{@name}"
  end

  def adopt_pet(animal)
    @pets.push(animal)
    return @pets
  end
end
