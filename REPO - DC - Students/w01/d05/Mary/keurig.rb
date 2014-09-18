class Kcup
  def initialize(variety)
    @variety = variety
    @is_unused = true
  end

  #getter
  def is_unused?
  end

  #getter
  def variety
  end

  #what phsyical actions can we take on this?
  def puncture
  end

end

class KeurigMachine
  def initialize
    @water_level = 0
  end

  # adds a specified amount of water into machine
  def add_water(amount)
  end

  # indicates the current amount of water in the machine; use percentage
  def water_level
  end

  # inserts K-cup into machine
  def insert_kcup(kcup)
  end

  def eject_kcup
  end

  def has_kcup?
  end

  # brew a drink of a specified size
  def brew(drink_size)
    # Requirements:
      # check if there is any water
      # check if there is a k-cup present
    # Outcome:
      # assess drink size and select amount of water
      # heat water
      # puncture k-cup and run water through
  end

  # select the brew temperature
  def select_brew_temperature(temp)
  end

  # alert if water tank is empty
  def water_empty?
  end


end
