class WaterBottle
  def initialize
    @water = 0
  end

  def is_empty?
    return @water
  end

  def fill
    @water = 3
    return @water
  end

  def drink
    @water -= 1
    return @water
  end
end
