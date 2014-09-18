class WaterBottle

  def initialize
    @is_empty = true
    @cap_on = true
  end

  def is_empty
    return @is_empty
  end

  def cap_on
    return @cap_on
  end

  def twist_cap!
    @cap_on = !cap_on
  end

  def fill_bottle!
    @is_empty = !is_empty
  end

  def dispense_liquid
    count = 1
    while count <= 3
    @is_empty = !is_empty
    puts "delicious, but still some left!"
    count += 1
    end
  end
end
