class KeurigMachine

  #  first, turn on the machine
  def on_off_switch
  end
  
  #  next, water checker checks for water in the reservoir (% full)
  def water_level_checker
  end
  
  #  checks for a full, unused keurig drink insert
  def keurig_cup_checker(kcup)
  end
  
  def keurig_cup_ejector
  end
  
  
  #  drink selector tells this method to take water from the reservoir, boil, and pump it through the insert cartige.
  def brew(how_much_water)
  end

  #  adds water to the machine
  def add_water(ammount)
  end

end





class KeurigDrinkInsert

  # Keurig inserts can be full or empty
  def initialize(insert_state)
  	@full = true
  end
  
  def is_unused?
  end

end