
class Client
 def initialize(name, age)
    @name = name
    @age = age
    @pets = []
  end

  def name
    return @name
  end

  def name=(name)
    @name = name
    return @name
  end

  def pets
    return @pets
  end

  def age
    return @age
  end

  def adopt_pet(animal)
    @pets.push(animal)
    return @pets
  end

  def return_pet(animal)
    @pets.delete(animal)
    return @pets
  end

  def prints_pets_names
     @pets.each do |pet|
      puts "#{@pets.index(pet)+1} #{pet.name} - #{pet.species}"
    end
  end
end

# A client should have a name.
# A client should have an age.
# A client can have multiple pets (animals), but it doesn't start with any.
