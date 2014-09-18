class CoffeeMaker
  def initialize
    @water_level = 0
    @cartridge = nil
  end

  def has_water?
    return @water_level > 0.25
  end

  def has_cartridge?
    return !@cartridge.nil?
  end

  def brew
    if has_water? && has_cartridge?
      puts 'Start brewing!'
    end
  end
end

pot = CoffeeMaker.new
puts pot.brew