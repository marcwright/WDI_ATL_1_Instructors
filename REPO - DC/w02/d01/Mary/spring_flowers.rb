class Flower
  #doesn't matter in abstract what the instance variables are set to; they are just placeholders
  def initialize
    @type = type
    @color = color
    @how_to_pick = "Break the stem!"
  end

  def type
    return @type
  end

  def color
    return @color
  end

  def how_to_pick
    # could also have put string here instead of instance variable up top
    return @how_to_pick
  end

end

class Tulip < Flower
  def initialize
    super
    @type = "perennial"
    @color = "purple"
  end

end

class Zinnia < Flower
  def initialize
    super
    @type = "annual"
    @color = "yellow"
  end

end

class Rose < Flower
  def initialize
    super
    @type = "perennial"
    @color = "red"
    # could also have added how_to_pick method to override the one in abstract
    @how_to_pick += " Wear gloves!"
  end

end
