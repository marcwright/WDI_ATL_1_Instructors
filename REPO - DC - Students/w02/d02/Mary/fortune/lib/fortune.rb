class FortuneCookie
  def initialize
    @wrapped = true
    @cracked = false
    @read = false
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
      return "Unwrap me!"
    elsif !cracked?
      return "Crack me!"
    else
      return "Here is your fortune!"
    end
  end

end