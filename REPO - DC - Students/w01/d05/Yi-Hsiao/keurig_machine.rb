require "pry"

class KeurigMachine
  def initialize water_level, powered_on, closed_lid
    @water_level = water_level
    @powered_on = powered_on
    @closed_lid = closed_lid
  end

  def toggle_power; @powered_on = @powered_on ? false : true; end
  def toggle_lid; @closed_lid = @closed_lid ? false : true; end
  def add_water(oz_water); @water_level += oz_water; end
  def ready_to_brew?(drink_size); @powered_on && @closed_lid && @water_level >= drink_size; end

  def brew k_cup, drink_size
    if self.ready_to_brew? drink_size
      @water_level -= drink_size  # reduces water level

      # if no k-cup is added to machine add hot water
      return "Finished brewing #{drink_size}oz. of hot water." unless k_cup

      # else return flavored drink based on k-cup
      k_cup.use_cup
      return "Finished brewing #{drink_size}oz. of delicious #{k_cup.flavor.downcase}." if k_cup
    end
  end
end

class K_Cup
  attr_reader :flavor

  def initialize flavor
    @new_cup = true
    @flavor = flavor
  end

  def use_cup; @new_cup = false; end
end

my_keurig = KeurigMachine.new 100, true, true
green_tea = K_Cup.new "Green Tea"
puts my_keurig.brew green_tea, 10
