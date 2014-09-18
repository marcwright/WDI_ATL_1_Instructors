class WaterBottle

  def initialize
    @empty = true
    @sip_count = 0
  end

  def empty?
    return @empty
  end

  def fill
    @sip_count = 3
    @empty = !empty?
  end

  def dispense
    if !empty?
      @sip_count = 0
      return @empty
    end
  end

end
