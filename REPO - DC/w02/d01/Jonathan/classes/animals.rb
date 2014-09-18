require 'Pry'

# ++++++++++++++
# Animal Class
# ++++++++++++++

class Animal
  def initialize(name="", species="")
    @name = name
    @species = species
    @toys = []
  end

# Animal Getters and Setters
# +++++++++++++++++++++++++++
  def name
    return @name.capitalize
  end

  def species
    return @species.capitalize
  end

  def toys
    return @toys.join.capitalize(", ")
  end

  def add_toy(toy)
    @toys.push(toy)
  end

# binding.pry

end
