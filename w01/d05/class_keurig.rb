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

  # Adds a specified amount of water to the machine
  def add_water(amount)
  end

  # Indicates the current amount of water in the machine (%)
  def water_level
  end

  # Inserts a KCup into the machine
  def insert_kcup(kcup)
  end

  def eject_kcup

  end

  def has_kcup?

  end

  # Brew a drink of a specified size (s, m, l)
  def brew(drink_size)
    # Requirements:
    # - check if there is an kcup present
    # - check if there is any water
    # Outcome:
    # - assess drink size and select amount of water
    # - heat water
    # - puncture kcup and run water through
  end

  # selects the brew temperature (range of temp)
  def select_brew_temperature(temp)   
  
  end

  # alert if water tank is empty
  def water_empty?

  end

end


KeurigMachine.new