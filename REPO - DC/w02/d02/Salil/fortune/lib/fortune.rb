class FortuneCookie

  def initialize
    @wrapped = true
    @cracked = false
  end

  def unwrap!
    @wrapped = false
  end

  def wrapped?
    return @wrapped
  end

  def crack!
    if wrapped?
      return false
    else
      @cracked = true
    end
  end

  def cracked?
    return @cracked
  end

end
