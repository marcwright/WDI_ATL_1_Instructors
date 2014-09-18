require 'Pry'

class Arena

  def initialize(name)
    @name = name.capitalize
    @gladiators = gladiators
    @entertained = entertained
  end

  def name
    return @name
  end

  def add_gladiator
    return @gladiators
  end

  def gladiators
    return @gladiators
  end

  def entertained
    return @entertained
  end


end
