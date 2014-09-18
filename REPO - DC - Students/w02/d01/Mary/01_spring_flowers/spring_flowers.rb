class Flower
  def initialize(type,color,harvest_rules)
    @type = type
    @color = color
    @harvest_rules = harvest_rules
  end

  def type
    return @type
  end

  def color
    return @color
  end

  def harvest_rules
    return "Break the stem!"
  end

end

class Tulip < Flower
  def initialize
    super
    @type = "perennial"
  end

end

class Zinnia < Flower
  def initialize
    super
    @type = "annual"
  end

end

class Rose < Flower
  def initialize
    super
    @type = "perennial"
  end

  def harvest_rules
    return "Wear gloves!!"
  end

end
