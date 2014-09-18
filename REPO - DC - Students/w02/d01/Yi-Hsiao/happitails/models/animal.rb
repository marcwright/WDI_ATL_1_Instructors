# - Animal:
#   - An animal should have a name.
#   - An animal should have a species.
#   - An animal can have multiple toys, but doesn't start with any.

class Animal
  attr_reader :name, :species

  def initialize(name="", species="")
    @name = name
    @species = species
    @toys = []
  end

  def to_s
    @name
  end
end
