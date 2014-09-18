require 'pry'

class Flower
  def initialize
    @type = ''
    @color = ''
    @how_to_pick = "Break the stem"
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
  def initialize(color)
    super
    @type = 'perennial'
    @color = color
  end
end

class Zinnia < Flower
  def initialize(color)
    super
    @type = 'annual'
    @color = color
  end
end

class Rose < Flower
  def initialize(color)
    super
    @type = 'perennial'
    @color = color
    @how_to_pick += ' Wear gloves.'
  end
end