# - Client:
#   - A client should have a name.
#   - A client should have an age.
#   - A client can have multiple pets (animals), but it doesn't start with any.

class Client
  attr_reader :name, :pets

  def initialize(name="", age=0)
    @name = name
    @age = age
    @pets = []
  end

  def add_pet(pet)
    if @pets.length < 2
      @pets << pet
    else
      puts "You have 2 pets already. Don't be a crazy cat lady."
      return nil
    end
  end

  def remove_pet(pet)
    @pets.delete(pet)
  end

  def to_s
    @name
  end
end
