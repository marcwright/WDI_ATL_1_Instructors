class Fighter
  def initialize
    @name = ""
    @actions = []
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
    when "ASZX"
      self.special_attack1()
      return true
    when "SSZX"
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
  end

  def test_for_special(combo)
    case combo
    when "ASSA"
      self.special_attack1()
      return true
    when "ZZZX"
      self.special_attack2()
      return true
    end
    return false
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
    @name = "Chun Li"
  end

  def test_for_special(combo)
    case combo
    when "XZXZ"
      self.special_attack1()
      return true
    when "AXXZ"
      self.special_attack2()
      return true
    end
    return false
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
    @name = "Chun Li"
  end

  def test_for_special(combo)
    case combo
    when "SSAA"
      self.special_attack1()
      return true
    when "XXZA"
      self.special_attack2()
      return true
    end
    return false
  end

  def special_attack1
    puts "Electric Thunder!"
  end

  def special_attack2
    puts "Rolling Attack!"
  end
end

fighter = Fighter.new
fighter.action("A").action("S").action("Z").action("X")
fighter.action("S").action("S").action("Z").action("X")
