class Arena
  attr_reader :name, :gladiators

  def initialize(name)
    @name = name.capitalize
    @gladiators = []
  end

  def add_gladiators(gladiator)
    if gladiators.length < 2
      gladiators.push(gladiator)
    end
  end

  def fight
    if gladiators.length == 2
      weapons = gladiators.map do |gladiator|
        gladiator.weapon
      end
      if weapons.include?("trident") && weapons.include?("spear")
        gladiators.delete_at(weapons.index("spear"))
      elsif weapons.include?("spear") && weapons.include?("club")
        gladiators.delete_at(weapons.index("club"))
      elsif weapons.include?("club") && weapons.include?("trident")
        gladiators.delete_at(weapons.index("trident"))
      elsif gladiators[0].weapon == gladiators[1].weapon
        gladiators.delete(gladiators[0])
        gladiators.delete(gladiators[1])
      end
    end
  end
end
