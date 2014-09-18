class ParkingMeter

  def initialize
    @timer = 0
  end

# Accept a coin and add an appropriate amount of purchased time
  def add_time=(coin)

  end

# Number that spcifies the number of minutes remaining
  def time_remaining

  end

# Specifies if the parking meter is currently expired
  def expired?

  end

end

class KeurigMachine


  def initialize
    @water_level = 0
  end

  # add a K-cup
  def insert_kcup(kcup)
    @kcup = kcup
  end

  # remove the K-cup
  def eject_kcup

  end

  # Brew a drink of a specified size (s, m, l)
  def brew(drink_size)
    # Requirements:
    # -- check if there is a kcup present
    # -- check if there is any water
    # Outcome:
    # -- assess drink size and select amount of water
    # -- heat water
    # -- puncture kcup and run water through
  end

  # select temperature for brewing
  def select_brew_temperature(temp)

  end

  # adds a specified amount of water to the machine
  def add_water(amount)

  end
  # indicates the current amount of water in the machine (%)
  def water_level
    return water_level
  end

  # alert if the water tank is empty
  def water_empty?

  end

class Kcup

  def initialize(variety)
    @vari = variety
    @is_unused = true
  end

  def is_unused?
    return @is_unused
  end

  def variety
    return variety
  end

  def puncture

  end
end


