# Stephen Stanwood (stephen@stanwoodsolutions.com)

class Animal
  attr_accessor :name, :species

  def initialize(name, species)
    @name = name.downcase
    @species = species
    @toys = []
  end

  def to_s
    return "#{name.capitalize} (a #{@species})"
  end
end

