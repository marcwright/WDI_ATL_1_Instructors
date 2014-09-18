class WaterBottle

  def initialize
    @water = 0
  end

  def water
    return @water
  end

  def fill!
    @water = 3
    return "Filled!"
  end

  def dispense!
    if water == 0
      return "There is no water in here."
    else
      @water -= 1
      return "water"
    end
  end

end
