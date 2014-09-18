class Student
  attr_reader :name, :knowledge_level, :energy_level

  def initialize(name)
    @name = name                  # student's name
    @knowledge_level = 0          # knowledge pool -- points are rewarded as student codes
    @max_energy = 100             # max_energy levels
    @energy_level = @max_energy   # student's energy pool -- resource used to code
    @is_alive = true              # the student is alive/dead
  end

  def code
    # cannot code when you are dead
    return nil unless alive?

    # student gains 1 knowledge point for every 20 energy points
    # energy decreases by 20 points for every coding session
    @knowledge_level += @energy_level / 20
    @energy_level -= 20

    # if the student codes with insufficient energy, the student dies
    @is_alive = false if @energy_level < 0

    return @knowledge_level
  end

  def rest
    # cannot rest when you are dead
    return nil unless alive?

    energy_increment_gain = 30  # energy points gained per rest action

    # can only add energy up to the maximum energy level
    energy_after_rest = @energy_level + energy_increment_gain
    @energy_level = energy_after_rest < @max_energy ? energy_after_rest : @max_energy
  end

  def alive?
    @is_alive
  end
end
