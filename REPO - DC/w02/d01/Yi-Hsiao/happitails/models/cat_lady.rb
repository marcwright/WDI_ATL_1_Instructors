class CatLady < Client
  def initialize(name="", age=0)
    @name = name
    @age = age
    @pets = []
  end

  def add_pet(pet)
    if pet.species.casecmp("cat") == 0
      @pets << pet
    else
      puts "I'm a crazy cat lady.  I only want cats."
      return nil
    end
  end
end
