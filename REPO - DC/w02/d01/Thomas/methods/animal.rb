class Animal
  def initialize(name, species)
    @name = name
    @species = species
    @toys = []
  end

  def name
    return @name
  end

  def name=(name)
    @name = name
    return @name
  end

  def species
    return @species
  end

  def species=(species)
    @species = species
    return @species
  end

  def create_animal
  end
end
