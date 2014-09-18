class WaterBottle

  def initialize
    @empty = true
    @sips = 0
  end

  def empty?
    return @empty
  end

  def sips?
    return @sips
  end

  def fill!
    if empty? == true
      @empty = false
      @sips = 3
    else
      puts "Already filled!"
    end
  end

  def dispense!
    if empty? != true
      @empty = true
      @sips -= 1
    else
      return "Water bottle is empty. Can't dispense."
  end
end

end
