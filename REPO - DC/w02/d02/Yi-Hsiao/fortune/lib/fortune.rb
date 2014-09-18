class FortuneCookie
  def initialize
    @wrapped = true
    @cracked = false
  end

  def wrapped?
    @wrapped
  end

  def cracked?
    @cracked
  end

  def unwrap!
    @wrapped = false
  end

  def crack!
    @wrapped ? "Please unwrap the cookie before you crack it." : @cracked = true
  end

  def read
    if !@wrapped && @cracked
      "A dubious friend may be an enemy in camouflage."
    elsif @wrapped
      "Please unwrap the cookie before you read it."
    else
      "Please crack open the cookie before you read it."
    end
  end
end
