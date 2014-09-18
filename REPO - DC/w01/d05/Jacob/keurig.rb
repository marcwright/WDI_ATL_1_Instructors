class Cartridge
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

class Machine
  def initialize
    @water_level = 0
  end

  #Adds a specified amount of water to the Machine
  def add_water(amount)
  end

  #Indicates the current amount of water in the machine (%)
  def water_level
  end

  #Inserts a cartridge into the machine
  def insert(cartridge)
  end

  def eject_cartridge
  end

  def has_cartridge?
  end

  #Brew a drink of a specified size (s,m,l)
  def brew(drink_size)
    #Requirements:
    #-check if there is a cartridge present
    #-check if there's any water
    #Outcome:
    #-assess drink size and select amount of water
    #-heat water
    #-puncture cartridge and run water through
  end

  #Selects the brew temperature (range of temp)
  def select_brew_temperature(temp)

  #Alert if water tank is empty
  def water_empty?
  end

end
