class FortuneCookie

  def initialize
    @wrapped = true
  end

  def wrapped?
    return @wrapped
  end

  def unwrap!
    @wrapped = false
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

  def read
    if wrapped?
      return "Unwrap me"
    else
      return "Crack me"
    end
  end


end
