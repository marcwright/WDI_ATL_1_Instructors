class Parking_meter

  #starts the parking meter
  def initialize
    @timer = 0
  end

  #number that specifies the number of minutes remaining
  def time_remaining
  end


  def add_coins (cointype)
    @amount = 0
    if cointype == "nickel"
      @amount += 5
    elsif cointype == "quarter"
      @amount += 25
    elsif cointype == "dime"
      @amount += 10
    end
    puts "total minutes: #{amount}"
  end

  #specifies if parking meter is expired.
  def expired?
  end

end

class Keurig

  def initialize(waterlevel)
  end

  def add_cartridge
  end

  def

end
