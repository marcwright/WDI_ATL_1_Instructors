
#Defining the 'Animals' class
class Animals
  def initialize(name, species)
    @name       = name
    @species    = species
    @toys       = []
  end

  # Getter and setter for name
  def name=(name)
    @name = name
    return @name
  end

  def name
    return @name
  end

  # Getter and Setter for 'species'

  def species=(species)
    @species = species
    return @species
  end

  def species
    return @species
  end

  # Setter for toys
  def toys
    return @toys
  end

end
