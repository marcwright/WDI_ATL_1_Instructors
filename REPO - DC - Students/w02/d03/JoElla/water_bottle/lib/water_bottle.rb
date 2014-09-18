class WaterBottle

  def initialize
    @water_level = 0
  end

  def isempty?
    if @water_level == 0
      return true
    end
  end

  def fill
    @water_level = 3
  end

  def dispense
    if @water_level > 0
      @water_level -= 1
    end
  end


end
