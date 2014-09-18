class Student
  attr_accessor :name, :knowledge, :energy
  def initialize(name)
    @name = name
    @knowledge = 0
    @energy = 100
  end

  def code
    if @energy > 50
      @knowledge += 100
      @energy -= 50
    else #too tired to code
      @knowledge #knowledge stays the same
      @energy -= 50 #energy still decreases because you try
    end
  end

  def take_a_break
    @energy += 50
  end

  def plan
    @energy += 100
  end
end
