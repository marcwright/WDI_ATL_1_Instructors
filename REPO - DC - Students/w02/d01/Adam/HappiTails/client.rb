#==========================
#Defining the Client Class
#==========================

class Client
  def initialize(name, age)
    @name = name
    @age = age
    @animals = []
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
    return @age
  end

  def animals
    return @animals
  end

  def add_animal(animal)
    @animals.push(animal)
  end
end
