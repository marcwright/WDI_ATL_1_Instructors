class Bottle

  def initialize
    @empty = true
    # @sip = 3
  end

  def empty
    return @empty
  end

  def fill!
    @empty = false
  end

  def dispense
    if @empty
      return false
    else
      @empty = true
      return "Water"
    end
  end

  # def sip
  #   if !empty






end
