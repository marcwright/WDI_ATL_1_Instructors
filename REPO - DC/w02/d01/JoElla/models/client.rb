class Client
  def initialize(name, age)
    @name = name
    @age = age
    @pets = []
  end

  attr_accessor :name
  attr_accessor :age
  attr_accessor :pets

  def add_pets(petname)
    @pets.push(petname)
  end

  # def to_s
  #   return "Our client #{name} is #{age} years old"
  # end

end
