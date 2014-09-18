

class Clients
  def initialize(name, age)
    @name       = name
    @age        = age
    @num_pets   = []
  end
  
  # Getter and setter for 'name'
  def name=(name)
    @name = name
    return @name
  end
  
  def name
    return @name
  end

  # Getter and setter for age
  def age=(age)
    @age = age
    return @gender
  end  
  
  def age
    return @age
  end

  # Setter for 'num_pets'
  def num_pets
    return @num_pets
  end

end
