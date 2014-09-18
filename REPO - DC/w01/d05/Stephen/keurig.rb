def KBrewer

  def initialize
    @water_level = 0
  end

  # Sets the brew volume for the machine.
  def set_volume(num_oz)
  end

  # Adds water to the Keurig
  def add_water(amount)
  end

  # Indicates the amount of water left in the Keurig
  def water_level
  end

  # Brews coffee
  def brew
  end

  # Provides data on ALL BREWING HISTORY EVER
  def get_brew_history
  end

  # Inserts a KCup into the machine
  def insert(kcup)
  end

  # Indicates whether the Keurig is open
  def is_open?
  end

  # Whether the machine currently has a KCup in it
  def has_cup?
  end

  # Whether the machine currently has a usable KCup in it
  def has_new_cup?
  end

  # Indicates whether the machine is plugged in and powered on.
  def powered_on?
  end

end

def KCup

  # Indicates what flavor the coffee/tea/hot chocolate/whatever is
  def get_flavor
  end

  # Throw away the KCup
  def dispose
  end

  # Indicates whether KCup is new or used
  def used?
  end

end
