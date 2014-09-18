require "pry"
class Flower
  def initialize
    @type = ""
    @color = ""
    @harvest_rules = "break the stem"
  end

  def type
    returns @type
  end

  def color
    returns @color
  end

end

class Rose < Flower
  def initialize
    @type = "perennial"
    @color = "red"
    #@harvest_rules += "wear gloves"
  end

end

class Zinnia < Flower
  def initialize
    @type = "annual"
    @color = "purple"
  end
end

class Tulip < Flower
  def initialize
    @type = "annual"
    @color = "yellow"
  end

end

binding.pry
