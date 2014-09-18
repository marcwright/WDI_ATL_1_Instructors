class Light

  def initialize
    @on = false
  end

  def on?
    return @on
  end

  def flip!
    @on = !on?
  end

end
