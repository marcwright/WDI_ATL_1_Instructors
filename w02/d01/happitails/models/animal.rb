class Animal
  def initialize(name, species)
    @name = name
    @species = species
    @toys = []
  end

  def name=(name)
    @name = name
  end

  def name
    @name
  end

  def species
    @species
  end
end
