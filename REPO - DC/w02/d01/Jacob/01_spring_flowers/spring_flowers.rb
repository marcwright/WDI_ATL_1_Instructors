class Flower
  def initialize(type = '', color = '')#the argument = '' format signifies a default setting
    @type = type #placeholder(doesn't matter what it's set to)
    @color = color#placeholder, as well
    @how_to_pick = "Break the stem."
  end

  def type
    return @type
  end

  def color
    return @color
  end

  def how_to_pick
    puts @how_to_pick
  end
end

class Tulip < Flower
  def initialize(type = '', color = '')#Convention dictates that the same arguments be used on the sub-class that are used in the super-class.
    super
    @type = 'perennial'
    @color = 'purple'
  end
end

class Zinnia < Flower
  def initialize(type = '', color = '')
    super
    @type = 'annual'
    @color = 'yellow'
  end
end

class Rose < Flower
  def initialize(type = '', color = '')
    super
    @type = 'perennial'
    @color = 'red'
    @how_to_pick += "Wear gloves."
  end

end

tulip_1 = Tulip.new()
zinnia_1 = Zinnia.new()
