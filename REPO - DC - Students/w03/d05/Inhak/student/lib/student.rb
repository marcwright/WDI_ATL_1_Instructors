class Student
  attr_accessor :knowhow, :energy, :name

  def initialize(name)
    @name = name
    @knowhow = 0
    @energy = 100
  end

  def code
    if @energy < 70
      return "Stop coding! You need a break."
    else
      @knowhow += 5
      @energy -= 7
    end
  end

  def rest
    @energy += 10
  end
end
