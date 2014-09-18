
class KeurigMatchine

  def initialize
    @powered_on = false
    @water_level = 0
    @closed_lid = false
  end

    #Adds a specified amount of water into machine
  def add_water(amount)

  end
    #Shows water level as a percentage to the machine
  def water_level

  end

    #Inserts new K-cup into machine
  def insert_kcup(k_cup)

  end

    #Allows users to input temperature
  def select_brew_temperature(temp)

  end

    #Eject cartridge
  def eject

  end
    # check if kcup present
  def has_kcup?

  end

    #Brew a drink of a specified size (s, m, l)
  def brew (cupsize)
    brew_flavor = k_cup.flavor
      # Requirements:
      # -check if there is a kcup present
      # -check if there is any water
      # Outcome:
      # assess drink size and slect amount of water
      # - heat water
      # - punction kcup and run watear through
      return "So energizing! A #{cupsize} cup!"
      if @powered_on && @water_level >= cupsize && @closed_lid
        water_level -= water_level
  end

  def toggle_lid
    @closed_lid = @closed_lid ? false : true
  end

  def toggle_power
    @powered_on = @powered_on ? false : true
  end

  def add_
end


class Cartridge
  attr_reader :flavor

  def initialize flavor
    @flavor = flavor
    @used? = false
  end

end


