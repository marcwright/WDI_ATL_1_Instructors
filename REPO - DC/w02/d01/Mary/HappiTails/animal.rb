
class Animal
  def initialize(name,species)
    @name = name
    @species = species
    @toys = []
  end

  def name
    return @name
  end

  def species
    return @species
  end

  def print_animal
    return "#{@name}, the #{@species}."
  end

  def toys
    return @toys
  end

  def add_toy(toy)
    @toys.push(toy)
    return @toys
  end

end
