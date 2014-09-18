class Fighter
  def initialize
    @actions = []
    @specials = {}
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
        puts "High Punch!"
      when "S"
        puts "Low Punch!"
      when "Z"
        puts "High Kick!"
      when "X"
        puts "Low Kick!"
      end
    end
    return self
  end

  def test_for_special(combo)
    if specials.has_key?(combo)
      puts specials[combo]
      return true
    end

    return false
  end
end

class Guile < Fighter
  def initialize
    name = "Guile"
    specials["ASSA"] = "Sonic Boom"
    specials["ZZZX"] = "Flash kick"
  end
end

class ChunLi < Fighter
  def initialize
    name = "Chun-Li"
    specials["XZXZ"] = "Lightning Kick"
    specials["AXXZ"] = "Spinning bird kick"
  end
end

class Blanka < Fighter
  def initialize
    name = "Blanka"
    specials["SSAA"] = "Electric Thunder"
    specials["XXZA"] = "Rolling Attack"
  end
end
