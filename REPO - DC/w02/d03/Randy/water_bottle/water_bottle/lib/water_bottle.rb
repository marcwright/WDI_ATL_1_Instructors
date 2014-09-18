class WaterBottle
  def initialize
    @empty = true
  end

  def empty?
    return @empty
  end

  def fill!
    @empty = false
  end

  def pour!
    return "Pour away!" if @empty = true
    return "I'm empty fill me up!" if empty? == false
      @empty = true
  end
end
