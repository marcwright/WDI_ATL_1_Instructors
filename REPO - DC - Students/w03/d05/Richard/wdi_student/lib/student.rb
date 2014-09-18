class Student
  attr_accessor :name, :energy, :knowledge

  def initialize(name, energy = 100, knowledge = 0)
    @name = name
    @knowledge = knowledge
    @energy = energy
  end

  def code
    if energy > 5 && energy < 31
      @energy = energy - 5
    elsif energy > 30
      @energy = energy - 5
      @knowledge = knowledge + 3
    else
      "You're too tired, Inhak! Take a break"
    end
  end

  def break
    if energy < 95 && energy > 30
      @energy = energy + 5
    elsif energy < 31
      @energy = 35
    else
      "You're already at a high energy Inhak, quit slacking"
    end
  end

  def consume_adderall
    @energy = energy + 50
  end
end

