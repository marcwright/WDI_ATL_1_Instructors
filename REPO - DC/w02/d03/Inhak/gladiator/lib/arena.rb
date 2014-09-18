require_relative "gladiator"

class Arena
  attr_accessor :name, :gladiators

  def initialize(name, gladiators=[])
    @name = name
    @gladiators = gladiators
  end

  def add_gladiator(name, weapon)
    if @gladiators.length >= 2
      return "ERROR: Too many gladiators! There's already two."
    else
      @gladiators.push(Gladiator.new(name, weapon))
    end
  end

  def fight
    if @gladiators[0].weapon == @gladiators[1].weapon
      @gladiators = []
      return "Both gladiators fought valiantly and died. Maybe they shouldn't have had the same weapon"
    elsif @gladiators[0].weapon == "Club"
      if @gladiators[1].weapon == "Spear"
        @gladiators.delete_at(0)
        retusrn "#{@gladiators[0].name} wins!!!"
      elsif @gladiators[1].weapon == "Trident"
        @gladiators.delete_at(1)
        return "#{gladiators[0].name} wins!!!"
      end
    elsif @gladiators[0].weapon == "Spear"
      if @gladiators[1].weapon == "Club"
        @gladiators.delete_at(1)
        return "#{@gladiators[0].name} wins!!!"
      elsif @gladiators[1].weapon == "Trident"
        @gladiators.delete_at(0)
        return "#{@gladiators[0].name} wins!!!"
      end
    elsif @gladiators[0].weapon == "Trident"
      if @gladiators[1].weapon == "Spear"
        @gladiators.delete_at(1)
        return "#{@gladiators[0].name} wins!!!"
      elsif @gladiators[1].weapon == "Club"
        @gladiators.delete_at(0)
        return "#{@gladiators[0].name} wins!!!"
      end
    end
  end
end
