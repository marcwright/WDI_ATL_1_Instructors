class Student

  attr_accessor :name, :knowledge, :energy_level

  def initialize(name)
    @name = name
    @knowledge = 0
    @energy_level = 100
  end

  def code

    @energy_level += -10 unless energy_level == 0
    @knowledge += 5 unless knowledge == 100

    if energy_level <= 20
      knowledge += 0
    end

  end

end
