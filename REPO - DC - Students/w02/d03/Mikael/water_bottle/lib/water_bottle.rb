class WaterBottle
  def initialize
    @empty = true
    @sips = 3
  end

  def is_empty?
    return @empty
  end

  def fill
    @empty = false
    @sips = 3
  end

  def dispense
    @empty = true
  end

  def sip
    if is_empty?
      return "Fill the bottle up!"
    else
      @sips -= 1
    end

    if @sips == 0
      @empty = true
    end
  end
end
