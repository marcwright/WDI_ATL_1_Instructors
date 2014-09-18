class WDIStudent
  attr_accessor :name, :knowledge, :energy

  def initialize(name)
    @name = name
    @knowledge = 0
    @energy = 100
  end

  def code
    @energy -= 50
    if !tired?
      @knowledge += 30
    end
  end

  def take_break
    @energy = 100
  end

  def tired?
    if energy >= 50
      return false
    else
      return true
    end
  end

  def plan

  end
end
