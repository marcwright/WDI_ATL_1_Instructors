class Student
  attr_accessor :name, :knowledge, :energy

  def initialize(name)
    @name = name
    @knowledge = 0
    @energy = 100
  end

  def code
    if energy > 25
      @knowledge += 5
    elsif @energy < 25
      @energy = 0
    end
    @energy -= 25
  end

  def break
    if @energy > 85
      @energy = 100
    else
      @energy += 15
    end
  end

end#class Student
