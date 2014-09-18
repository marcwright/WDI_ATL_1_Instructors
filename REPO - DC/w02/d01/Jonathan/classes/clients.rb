# ++++++++++++++
# Client Class
# ++++++++++++++
class Client
  def initialize(name="", age= 0)
    @name = name
    @age = age
    @pets = []
  end

# Client Getters / Setters
# +++++++++++++++++++++++++
  def name
    return @name
  end

  def age
    return @age
  end

  def pets
    return @pets
  end

  def add_pet(pets)
    @pets.push(pets)
  end

  def delete_pet(pets)
  @pets.delete(pets)
  end

end
