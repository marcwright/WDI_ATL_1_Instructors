class Flower
  def initialize
    @type = ""
    @color = ""
    @harvest_rules = "Break the stem."
  end

  def type
    return @type
  end

  def color
    return @color
  end

  def harvest_rules
    return @harvest_rules
  end
end

class Tulip < Flower
  def initialize(type, color)
    super
    @type = "perennial"
    @color = "blue"
  end

  def harvest_rules
    return puts "Place in a vase immediately!"
  end
end

class Zinnia < Flower
  def initialize(type, color)
    super
    @type = "annual"
    @color = "white"
  end

  def harvest_rules
    @harvest_rules += "Handle with care, place in direct sunlight."
    return @harvest_rules
  end
end

class Rose < Flower
  def initialize(type, color)
    super
    @type = "perennial"
    @color = "red"
  end

  def harvest_rules
    super
    @harvest_rules += "Wear gloves"
    return @harvest_rules
  end
end

