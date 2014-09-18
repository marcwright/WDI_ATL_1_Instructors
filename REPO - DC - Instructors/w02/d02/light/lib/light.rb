class Light
  def initialize
    @on = false
  end

  def flip!
    @on = !on?
  end

  def on?
    @on
  end
end