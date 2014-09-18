class WaterBottle
  attr_reader :max_capacity, :water_level

  def initialize
    @max_capacity = 3 # number of sips
    @water_level = 0 # number of sips
  end

  def filled?
    @water_level > 0
  end

  def fill!
    @water_level = @max_capacity unless @water_level == @max_capacity
  end

  def dispense
    if @water_level > 0
      @water_level -= 1
      "water"
    end
  end
end
