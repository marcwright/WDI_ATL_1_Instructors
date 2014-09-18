# Flower [abstract]
require "pry"

class Flower
  def initialize
    @type = ''
    @harvest_rules
    @color = ''
  end

  def type
    return @type
  end

  def color
    return @color
  end

  def harvest_rules
    puts "Break the stem"
  end

end

class Tulip < Flower
  def initialize
    super
    @type = 'Perrenial'
    @color = 'Blue'
  end

  def name
    @name = "Tulip"
  end
end

class Zinnia < Flower
  def initialize
    super
    @type = 'Annual'
    @color = 'Yellow'
  end
end

class Rose < Flower
  def initialize
    super
    @type = 'Perrenial'
    @color = 'Rose'
    @harvest_rules = 'Wear gloves'
  end

end

tulip = Tulip.new()
puts tulip

zinnia = Zinnia.new()
puts zinnia

rose = Rose.new()
puts rose

binding.pry
