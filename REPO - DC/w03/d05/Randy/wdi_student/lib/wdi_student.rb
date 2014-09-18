class Student
  attr_accessor :knowledge, :energy, :plan
  attr_reader :name

  def initialize(name)
    @name = name
    @knowledge = 0
    @energy = 100
    @plan = 0
  end

  def is_tired?
    if self.energy < 50
      return true
    else
      return false
    end
  end

  def code
    if @plan != 0
      @plan -= 1
    else
      @energy -= 20
    end

    if self.is_tired? == false
      @knowledge += 10
    elsif self.is_tired? == true
      return "You are too tired to learn!"
    end
  end

  def break
    @energy = 100
  end

  def plan
    @plan = 2
  end


end
