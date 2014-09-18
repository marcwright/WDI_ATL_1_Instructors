class Arena
  attr_reader :name, :gladiators, :winners

  def initialize(name)
    @name = name.capitalize
    @gladiators = []
    @winners = {spear: "trident", club: "spear", trident: "club"}
  end

  def add_gladiator(gladiator)
    if gladiators.length < 2
      gladiators << gladiator
    else
      return "This arena is full!"
    end
  end

  def fight

    w1 = gladiators[0].weapon.to_sym
    w2 = gladiators[1].weapon.to_sym

    if gladiators[0].weapon == gladiators[1].weapon
      @gladiators = []
    elsif winners[w1] == gladiators[1].weapon
      gladiators.shift
    elsif winners[w2] == gladiators[0].weapon
      gladiators.pop
    end



  end


end
