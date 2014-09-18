require 'Pry'

class Flower
  def initialize
    @name = ''
    @color = ''
  end

  def type
    return @type
  end

  def color
    return @color
  end

  def how_to_pick
    puts "Break the stem"
end

binding.pry

class Tulip < Flower
  def initialize
  # Ref: Flower
    super
    @type = 'perennial'
    @color = 'white'
  end

class Zinnia < Flower
    def initialize
  # Ref: Flower
    super
    @type = 'perennial'
    @color = 'yellow'
  end

class Rose < Flower
  def initialize
  # Ref: Flower
    super
    @type = 'annual'
    @color = 'red'
  end
