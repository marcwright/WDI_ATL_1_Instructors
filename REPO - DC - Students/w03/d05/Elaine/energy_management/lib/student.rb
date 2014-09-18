
class Student

  attr_reader :name
  attr_accessor :energy, :knowledge

  def initialize(name)
    @name = name
    @energy = 100
    @knowledge = 0
  end

  def code
    @knowledge += 5
    @energy -=25
  end

  def break
    if @energy < 85
      @energy +=15
    else
      @energy = 100
    end
  end

end
