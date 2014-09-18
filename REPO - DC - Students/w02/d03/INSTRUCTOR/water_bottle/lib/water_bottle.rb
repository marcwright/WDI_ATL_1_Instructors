class WaterBottle

  def initialize
    @empty = true
  end

  def is_empty?
    @empty
  end

  def fill
    @empty = false
  end

  def dispense
    if is_empty?
      return false
    else
      @empty = true
      return "Water"
    end

  end

end
