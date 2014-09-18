# Stephen Stanwood (stephen@stanwoodsolutions.com)

class Client
  attr_accessor :name, :age, :pets

  def initialize(name, age)
    @name = name.downcase
    @age = age
    @pets = []
  end

  def adopt(animal)
    @pets.push(animal)
  end

  def return(animal)
    @pets.delete(animal)
  end

  def to_s
    return "#{name.capitalize} (a #{@age}-year-old with #{@pets.size} pet(s))"
  end
end
