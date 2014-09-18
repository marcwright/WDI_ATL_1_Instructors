require "pry"
class Arena

attr_reader :name, :gladiators

  def initialize(name, gladiators=[])
    @name = name.capitalize
    @gladiators = gladiators
  end

  def add_gladiator(gladiator)
    if @gladiators.length < 2
      @gladiators.push(gladiator)
    elsif @gladiators.length >= 2
      gladiators.shift
      gladiators.push(gladiator)
    end
  end

  def fight
    beats = {
        "spear" => "trident",
        "club" => "spear",
        "trident" => "club"
        }
    if gladiators[0].weapon == gladiators[1].weapon
      @gladiators = []
    elsif beats[gladiators[0].weapon] == gladiators[1].weapon
      @gladiators.delete_at(0)
    elsif beats[gladiators[0].weapon] != gladiators[1].weapon
      @gladiators.delete(1)
    end
    return @gladiators
  end
end
