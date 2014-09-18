class Light

  def initialize
    @on = false
  end

  # returns value = initialize value of @on
  def on?
    return @on
  end

  def flip!
    @on = !on? #aka not equal to what the method on? returns
  end

end
