#class Flower - Abstract
class Flower
  def initialize
    @color = " "
    @year = " "
    @rules = "Break the stems!"
  end

  def color
    return @color
  end

  def type
    return @year
  end

  def harvest_rules
    return @rules
end


class Rose < Flower
  def initialize(color)
    super
    @color = color
    @year = "Perennial"
    @rules += "Watch the thorns, wear gloves!"
  end
end

class Tulip < Flower
  def initialize(color)
    super
    @color = color
    @year = "Perennial"
  end
end

class Zinnia < Flower
  def initialize(color)
    super
    @color = color
    @year = "Annual"
  end
end
