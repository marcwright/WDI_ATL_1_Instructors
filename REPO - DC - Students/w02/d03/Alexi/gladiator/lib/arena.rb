class Arena
  def initialize(name)
    @name = name
    @glad_array = []
  end

  def name
    return @name
  end

  def add_gladiator(name, weapon)
    glad_array.push(name, weapon)
    return glad_array
  end

end # - END class Arena
  
