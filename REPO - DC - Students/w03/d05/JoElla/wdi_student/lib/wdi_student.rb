class Student
  attr_accessor :knowledge
  attr_reader :name, :energy

  def initialize(name)
    @name = name
    @knowledge = 0
    @energy = 100
  end

  def code
    @knowledge += 5
    @energy -= 5
  end

  def break
    if @energy > 95
      @energy = 100

end
