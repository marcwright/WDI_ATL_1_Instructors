class Flower
  def initialize(type='', color='')
    @type = type
    @color = color
  end

  def type
    return @type
  end

  def color
    return @color
  end

  def harvest_rules
    return "This flower can be cut to be harvested."
  end
end

class Rose < Flower
  def initialize
    super
    @type = "perennial"
    @color = "red"
  end

  def harvest_rules
    return "wear gloves when you harvest these!"
  end

end

class Tulip < Flower
  def initialize
    super
    @type = "perennial"
    @color = "purple"
  end
end

class Zinnia
  def initialize
    super
    @type = "annual"
    @color = "pink"
  end
end

puts Rose.new.type
puts Tulip.new.type
