require 'pry'

class Flower

  #setter
  def initialize
    @type = ''
    @color = ''
    @how_to_pick = "Break the stem"
  end

  #getters
  def type
    return @type
  end

  def color
    @color = color
  end

  def how_to_pick
    puts "Break the stem"
  end
end

class Tulip < Flower
  def initialize
    super
    @type = 'perennial'
    @color = 'purple'
  end
end    

class Zinnia < Flower
  def initialize
    super
    @type = 'annual'
    @color = 'yellow'
  end
end

class Rose < Flower
  def initialize
    super
    @type = 'perennial'
    @color = 'red'
    @how_to_pick += 'Wear gloves'
  end

end
