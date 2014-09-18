class Student
  TIRED_THRESHHOLD = 40
  ENERGY_TO_CODE = 10
  KNOWLEDGE_FROM_CODE = 10
  ENERGY_FROM_BREAK = 20

  def initialize(name)
    @name = name
    @knowledge = 0
    @energy = 100
    @history = []
  end

  attr_accessor :name, :energy, :knowledge, :history

  # Coding increases your knowledge, but takes away from your energy
  def code
    self.knowledge += KNOWLEDGE_FROM_CODE if energy >= TIRED_THRESHHOLD
    self.energy -= ENERGY_TO_CODE if history.last != :plan
    self.energy = 0 if energy < 0
    history.push(:code)
  end

  # If you take a break, you are less tired
  def break
    self.energy += ENERGY_FROM_BREAK
    self.energy = 100 if energy > 100
    history.push(:break)
  end

  # If you plan right before you code, you can code twice in a row
  def plan
    history.push(:plan)
  end

  def to_s
    return "#{name}\nEnergy Level: #{energy}\nKnowledge: #{knowledge}"
  end
end