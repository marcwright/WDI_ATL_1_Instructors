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

end
