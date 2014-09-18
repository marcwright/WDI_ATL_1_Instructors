# Animal Abstract
class Animal
  def initialize
    @brain = true
    @legs = 0
  end
  
  def has_brain?
     return @brain
  end
  
  def leg_count
    return @legs
  end
end


# Human implementation
class Human < Animal
  def initialize
    super
    @legs = 2
  end
end


# Pet Abstract
class Pet < Animal
  def initialize
    super
    @legs = 4
    @fleas = 0
  end

  def flea_count
    return @fleas
  end
end


# Dog implementation
class Dog < Pet
  def initialize
    super
    @fleas = 8;
  end
end


# Cat implementation
class Cat < Pet
  def initialize
    super
    @fleas = 5;
  end
end
