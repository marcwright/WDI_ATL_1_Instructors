# Parking Meter

class ParkingMeter
  def initialize
    @time = 0
  end

  def time_remaining
    return @time
  end

  def is_expired?
    @time == 0
  end

  def insert_coin(value)
    @time += value
  end
end


# Keurig Coffee Maker

class KeurigCoffeeMachine
  # Provides a reference to the current cartridge
  def current_cartridge

  end

  # Specifies if the machine currently has a cartridge
  def has_cartridge?

  end

  # Inserts a new cartridge into the machine
  def insert_cartridge(cartridge)

  end

  # Removes the currently loaded cartridge
  def remove_cartridge()

  end

  # Specifies the water level in reservoir,
  # as a percentage value between 0 and 1
  def water_level

  end

  # Adds a volume of water into the reservoir
  def add_water(volume)

  end

  # Starts the brewing of a cup of coffee
  def brew(cup_size)

  end
end