# Stephen Stanwood (stephen@stanwoodsolutions.com)

class Gladiator
  attr_accessor :name, :weapon

  def initialize(name, weapon)
    @name = name
    @weapon = weapon
  end
end

class Arena
  attr_accessor :name, :gladiators

  def initialize(name)
    @name = name.split.map(&:capitalize).join(' ')
    @gladiators = []
  end

  # Adds a new gladiator to the arena
  def add(name, weapon)
    gladiators.push(Gladiator.new(name, weapon)) if (gladiators.size < 2)
  end

  # Deletes a gladiator by name
  def remove(name)
    gladiators.reject! { |g| g.name == name }
  end

  # Reveals whether the crowd is entertained (which requires Maximus)
  def entertained?
    return (gladiators.map { |g| g.name }).include? "Maximus"
  end

  # Commences a fight if there are two gladiators present
  def fight
    return false if gladiators.size != 2

    # The names of each gladiator
    n1 = gladiators[0].name
    n2 = gladiators[1].name

    # Check for the special case that Maximus is around
    if n1 == "Maximus"
      remove(n2)
      return
    end

    if n2 == "Maximus"
      remove(n1)
      return
    end

    # If no Maximus, get weapons for each gladiator
    w1 = gladiators[0].weapon
    w2 = gladiators[1].weapon

    # If weapons are the same, remove both gladiators
    if w1 == w2
      remove(n1)
      remove(n2)
    else
      case w1
      when "Spear"
        # Spear loses to Trident but beats Club
         (w2 == "Trident") ? remove(n1) : remove(n2)
      when "Trident"
        # Trident loses to Club but beats Spear
        (w2 == "Club") ? remove(n1) : remove(n2)
      when "Club"
        # Club loses to Spear but beats Trident
        (w2 == "Spear") ? remove(n1) : remove(n2)
      end
    end
  end
end
