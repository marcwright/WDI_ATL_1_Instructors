class Student
  attr_reader :name, :knowledge, :energy, :planned

  def initialize(name)
    @name = name
    @knowledge = 0
    @energy = 100
    @planned = false
  end

  def code
    if planned == true
      @knowledge += 10
      @planned = false
    else
      if energy > 50
        @knowledge += 10
        @energy -= 10
      else
        @energy -= 10
      end
    end
  end

  def break
    @energy = 100
  end

  def plan
    @planned = true
  end

end
