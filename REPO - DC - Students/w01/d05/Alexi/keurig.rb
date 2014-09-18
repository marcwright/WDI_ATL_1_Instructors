require "pry"

class Coffee_machine
  def initialize
    @power_on? = false
    @water_level = 0
    @lid_status? = false
  end
 
  def brew cup_size, kcup
    @flavor = flavor
    brew_flavor = kcup.flavor

  def toggle_power
    @power_on ? closed_lid ? false : true
  end

  def toggle_lid
    @closed_lid = @closed_lid ? false : true
  end

  def add_water oz_water
    @water_level += oz_water

    if @power_on && @lid_status && water_level >= brew_size
      return "#{brew_flavor} in #{brew_size}"

  end
end

class Kcup
  def initialize flavor
    @flavor = flavor
    @cup_unused = false
  end

  def is_unused?
  end

  def variety
  end

  def puncture
  end

end
