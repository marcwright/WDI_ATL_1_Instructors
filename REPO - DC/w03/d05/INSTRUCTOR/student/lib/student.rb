class Student

  attr_reader :name, :energy
  attr_accessor :knowledge

  def initialize(name)
    @name = name
    @energy = 100
    @knowledge = 0
  end

  def code
    if @energy > 25
      @knowledge += 5
      @energy -= 25
    elsif @energy < 25
      @energy = 0
    end
  end

  def break
    if @energy > 85
      @energy = 100
    else
      @energy += 15
    end
  end
end
