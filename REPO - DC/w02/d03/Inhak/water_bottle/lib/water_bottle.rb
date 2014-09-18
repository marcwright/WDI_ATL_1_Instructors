class WaterBottle
  def initialize
    @full = false
  end

  def full?
    return @full
  end

  def fill!
    @full = true
  end

  def dispense
    if @full == false
      return false
    else
      @full = false
      return "Water"
    end
  end

end
