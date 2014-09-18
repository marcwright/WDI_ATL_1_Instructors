class Client
  def initialize(name="", age= 0)
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
    @pets.push(pet)
  end

  def remove_pet(pet)
    @pets.delete(pet)
  end

  def to_s
    return name
  end
end
