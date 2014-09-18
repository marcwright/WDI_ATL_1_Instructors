class Kcup
  def initialize(variety)
    @variety = variety
    @is_unused = true
  end

  def is_unused?
  end

  def variety
  end

  def puncture

  end
end

class KeurigMachine
  def initialize
    @water_level = 0
  end

  #adds a specified amount of water to the machine
  def add_water(amount)
  end

  #indicates the current  percentage of water in the machine
  def water_level
  end

  #inserts a kcup into the machine
  def insert_kcup(kcup)
  end

  def eject_kcup

  end

  #brew a drink of a specified size, (s/m/l)
  def brew(drink_size)
    # Requirements:
    # check if there is any water
    # check if there is a k_cup present
    # assess drink size and select amount of water
    # heat water
    # puncture kcup and run water through
  end

  def enough_water?
    if @water_level == 0
    return true
  end
end
