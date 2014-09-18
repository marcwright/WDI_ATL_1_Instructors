#Flower Abstract
class Flower
  def initialize(type='', color='')
    @type = ''
    @color = ''
  end

  def type
    return @type
  end

  def color
    return @color
  end

  def how_to_pick

    puts 'Break the stem'
  end
end

class Tulip < Flower
  def initialize(type, color)
    super(type, color)
    @type = 'perennial'
    @color = 'purple'
  end
end

class Zinnia < Flower
  def initialize(type, color)
    super(type, color)
    @type = 'annual'
    @color = 'yellow'

  end
end

class Rose < Flower
  def initialize(type, color)
    super(type, color)
    @type = 'perennial'
    @color = 'red'
    @how_to_pick += 'Wear some gloves'
  end
end
