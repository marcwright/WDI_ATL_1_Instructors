class Arena
  attr_reader :name, :gladiators
  def initialize(arena_name,gladiators=nil)
    @name = arena_name.capitalize
    @gladiators = []
  end

  def add_gladiator(gladiator)
    if @gladiators.length < 2
      @gladiators.push(gladiator)
    else
      return "Only two at a time!"
    end
  end

  def fight
    beats = {
      "trident" => "spear",
      "spear" => "club",
      "club" => "trident",
    }
    if @gladiators.length < 2
      return "Must have two gladiators to fight!"
    else
      if beats[@gladiators[0].weapon] == @gladiators[1].weapon
        # puts "Thumbs up or down?"
        # thumb_direction = gets.chomp.downcase
        # if thumb_direction == "down"
          @gladiators.delete(@gladiators[1])
        # else
        #   @gladiators.delete(@gladiators[0])
        # end
      elsif beats[@gladiators[1].weapon] == @gladiators[0].weapon
      #   puts "Thumbs up or down?"
      #   thumb_direction = gets.chomp.downcase
      #   if thumb_direction == "down"
          @gladiators.delete(@gladiators[0])
        # else
        #   @gladiators.delete(@gladiators[1])
        # end
      elsif @gladiators[0].weapon == @gladiators[1].weapon
        @gladiators.clear
      end
    end
  end

  def delete_gladiator(gladiator)
    gladiators.delete(gladiator)
  end

  def entertained?
    if @gladiators[0].name == "Maximus"
      true
    elsif @gladiators[1].name == "Maximus"
      true
    else
      false
    end
  end

end
