class FortuneCookie

  def initialize
    @wrapped = true
    @cracked = false
  end

  def wrapped?
    return @wrapped
  end

  def unwrap!
    @wrapped = false
  end

  def cracked?
   return @cracked
  end

  def crack!
    if wrapped?
      return false
    else
      @cracked = true
    end
  end

  def read
    if wrapped?
      return "Unwrap me"
    elsif !cracked?
      return "Crack"
    else
      return "Yo"
    end
  end

end
