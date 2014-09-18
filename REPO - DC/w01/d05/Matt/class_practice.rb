class Cup
  def initialize
    @flavor = flavor
    @size = 1
  end

  def flavor
    @flavor = flavor
  end

end

class Coffee

  def initialize(options)
    @water_level = 0
    @brew_select = options[:brew_select]
    @status = options[:status]
    @temp = options[:temp]
  end

  # turn on/up/off
  def power
    @power = power
  end

  def power
    return power
  end

  # specifies amount of water to use
  def size
    @size = size
  end

  def size
    return @size
  end

  # temperature level
  def temp=(temp)
    @temp = temp
  end

  def temp
    return @temp
  end



  # checks water level
  def water_level?
    water_level >= size
  end

  # checks if drink can be made
  def status?('ready','not_ready')
    if status('ready') || status('not_ready')
      return
    end
  end



  #
end
