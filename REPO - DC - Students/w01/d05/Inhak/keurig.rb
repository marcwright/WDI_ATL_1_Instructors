class Keurig

  def initialize(waterlevel)
    @waterlevel = waterlevel
  end

  def add_cartridge(coffee)
  end

  def remove_cartridge
  end

  def add_water(amount)
  end
  # percentage of water full.
  def check_water
  end

  def water_empty
  end

  #brew a drink size of specified size
  def brew(drink_size)
    #requirements
    #check if there is a kcup present
    #check if there is any water
    #Outcome:
    #assess drink size and selection amount of water
    # heat water
    # puncture kcup and run water through
  end

  def ready?
  end

end

class CoffeeCartridge
  def initialize(variety)
    @variety = variety
    @is_unused = true
  end

  def what_coffee
    return @variety
  end

  def puncture
  end

  def is_unused?
  end
end
