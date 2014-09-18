
# Protocol Droid (extends Robot)
class ProtocolDroid < Robot
  def initialize
    @name = 'C3PO'
  end

  protected

  def get_speaking_quote(index)
    case index
    when 1
      return "Oh, my! What have you done? I'm BACKWARDS. You flea-bitten furball!"
    when 2
      return "Sir, it's quite possible this asteroid is not entirely stable."
    else
      return "Noisy brute. Why don't we just go to lightspeed?"
    end
  end
end