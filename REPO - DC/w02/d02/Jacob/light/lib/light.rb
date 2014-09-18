class Light

  def intialize
    @on = false
  end

  def on?
    return @on
  end

  def flip!
    @on = !on?
  end

end
