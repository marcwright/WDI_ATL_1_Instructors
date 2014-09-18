# # Street Fighter

# Model the arcade classic, "Street Fighter". Complete this exercise within the provided `street_fighter.rb`:

# 1. Extend **Fighter** into multiple fighter subclasses, each with their own special combos and attack moves, as follows:
#   * **Guile**
#     - "ASSA": Sonic Boom
#     - "ZZZX": Flash kick
#   * **Chun-Li**
#     - "XZXZ": Lightning Kick
#     - "AXXZ": Spinning bird kick
#   * **Blanka**
#     - "SSAA": Electric Thunder
#     - "XXZA": Rolling Attack
# 2. DRY out your implementation as much as possible, keeping as much code as possible defined once in the Fighter abstract.
# 3. Isolate the private/protected interface.
# 4. Test the outcome of your actions on each specific character!

class Fighter
  def initialize
    @name = ""
    @actions = []
    @special_attacks = []
  end

  def action(code)
    code = code.upcase
    @actions.push(code)

    # Pass last four action codes into the special-move test:
    if @actions.length >= 4
      combo = @actions[-4..-1].join('')
      test_for_special(combo)
    else
      case code
      when "A"
        self.high_punch()
      when "S"
        self.low_punch()
      when "Z"
        self.high_kick()
      when "X"
        self.low_kick()
      end
    end
    return self
  end

  def high_punch
    puts "High Punch!"
  end

  def low_punch
    puts "Low Punch!"
  end

  def high_kick
    puts "High Kick!"
  end

  def low_kick
    puts "Low Kick!"
  end

  def test_for_special(combo)
    case combo
    when @special_attacks[0]
      self.special_attack1()
      return true
    when @special_attacks[1]
      self.special_attack2()
      return true
    end
    return false
  end

  def special_attack1
    puts "Special Attack 1!"
  end

  def special_attack2
    puts "Special Attack 2!"
  end
end

class Guile < Fighter
  def initialize
    super
    @name = "Guile"
    @special_attacks = ["ASSA", "ZZZX"]
  end

  def special_attack1
    puts "Sonic Boom!"
  end

  def special_attack2
    puts "Flash Kick!"
  end
end

class ChunLi < Fighter
  def initialize
    super
    @name = "Chun-Li"
    @special_attacks = ["XZXZ", "AXXZ"]
  end

  def special_attack1
    puts "Lightning Kick!"
  end

  def special_attack2
    puts "Spinning Bird Kick!"
  end
end

class Blanka < Fighter
  def initialize
    super
    @name = "Blanka"
    @special_attacks = ["SSAA", "XXZA"]
  end

  def special_attack1
    puts "Electric Thunder!"
  end

  def special_attack2
    puts "Rolling Attack!"
  end
end

guile = Guile.new
guile.action("A").action("S").action("S").action("A")

chun_li = ChunLi.new
chun_li.action("X").action("Z").action("X").action("Z")

blanka = Blanka.new
blanka.action("S").action("S").action("A").action("A")
