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

  def age
    return @age
  end

  def age=(age)
    @age = age
    return age
  end

  def add_pet(pet)
    #binding.pry
    @pets.push(pet)
  end

end
