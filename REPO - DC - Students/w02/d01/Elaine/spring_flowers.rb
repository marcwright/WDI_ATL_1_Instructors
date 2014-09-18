class Flower

  def initialize    # (type='', color='') Sets default to blank string.
    @type = ''
    @color = ''
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

# Class Tulip
class Tulip < Flower

  def initialize
    super
    @type = "perennial"
    @color = "yellow"
  end

end

# Class Zinnia
class Zinnia < Flower

  def initialize
    super
    @type = "annual"
    @color = "red"
  end

end

# Class Rose
class Rose < Flower

  def initialize
    super
    @type = "perennial"
    @color = "white"
    @harvest_rules += " Wear gloves."
  end

end

tulip_1 = Tulip.new
puts tulip_1.harvest_rules

zinnia_1 = Zinnia.new
puts zinnia_1.harvest_rules

rose_1 = Rose.new
puts rose_1.harvest_rules
