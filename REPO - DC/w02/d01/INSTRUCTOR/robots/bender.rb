# Bender (extends Robot)
class Bender < Robot
  def initialize
    @name = 'Bender'
  end
  
  protected

  def get_speaking_quote(index)
    case index
    when 1
      return "Aw, I just made myself feel bad."
    when 2
      return "Stupid can opener! You killed my father, and now you've come back for me!"
    else
      return "Bite my shiny metal butt."
    end
  end
end