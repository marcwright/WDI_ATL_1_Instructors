# Stephen Stanwood (stephen@stanwoodsolutions.com)

class Flower
  attr_reader :type, :color

  def harvest_rules
    return "break the stem"
  end

  def to_s
    return "The #{self.class.name.downcase} is a #{color} flower. To harvest, #{harvest_rules}\n"
  end
end

class Tulip < Flower
  def initialize
    @type = "perennial"
    @color = "yellow"
  end
end

class Zinnia < Flower
  def initialize
    @type = "annual"
    @color = "pink"
  end
end

class Rose < Flower
  def initialize
    @type = "perennial"
    @color = "red"
  end

  def harvest_rules
    return super + " and wear gloves!"
  end
end

t = Tulip.new
z = Zinnia.new
r = Rose.new

puts t
puts z
puts r
