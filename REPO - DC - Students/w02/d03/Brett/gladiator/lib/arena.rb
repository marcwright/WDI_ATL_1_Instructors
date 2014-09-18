require_relative '../lib/gladiator'

class Arena
  attr_reader :name, :gladiators

  def initialize(name)
    @name = name.capitalize
    @gladiators = []
    @beats = {
      "spear" => "trident"
      "club" => "spear"
      "trident" => "club"
    }
  end

  def add_gladiator!(name, weapon)
    if @gladiators.length < 2
      @gladiators << Gladiator.new(name, weapon)
    else
    end
  end

  def fight!
     if
       @gladiators[0].weapon == @gladiators[1].weapon
       return "Tie, both die!"
     elsif
       @gladiators[0].weapon == "trident" && @gladiators[1].weapon == "spear"
       return "#{gladiators[0].name} wins with trident!"
     elsif
       @gladiators[0].weapon == "spear" && @gladiators[1].weapon == "club"
       return "#{@gladiators[1].name} wins with spear!"
     elsif
       @gladiators[0].weapon == 'club' && @gladiators[1].weapon == 'trident'
       return "#{@gladiators[1].name} wins! with club!"
     elsif
       @gladiators[0].weapon == 'spear' && @gladiators[1].weapon == 'trident'
       return "#{@gladiators[0].name} wins with spear!"
     elsif
       @gladiators[0].weapon == "club" && @gladiators[1].weapon == 'spear'
       return "#{@gladiators[0].name} wins with club!"
     else
       @gladiators[0].weapon == "trident" && @gladitors[1].weapon == 'club'
       return "#{@gladiators[1].name} wins with trident!"
    end
  end
end
