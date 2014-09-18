class Arena
  attr_accessor :name, :gladiators

  def initialize(name)
    @name = name.capitalize
    @gladiators = []
  end

  def add_gladiator(gladiator)
    @gladiators << gladiator
  end

  def gladiator_count
    if @gladiators.length > 2
      return "Only two at a time!"
    elsif @gladiators.length == 2
      return true
    else
      return false
    end
  end

  def remove_gladiator(name)
    gladiators.each_with_index {|instance, index|
      if instance.name = name
        gladiators.delete_at(index)
      end}
      return @gladiators
  end

  def entertained?
    if @gladiators.each {|instance|instance.name == "Maximus"}
      return true
    end
  end

  def fight
    beats = {"Spear" => "Trident", "Club" => "Spear", "Trident" => "Club"}
    if gladiator_count == true

      if @gladiators[0].weapon == @gladiators[1].weapon
        @gladiators = []

      elsif beats[@gladiators[0].weapon] == @gladiators[1].weapon
        puts "Finish him? (y/n)"
          response = gets.chomp
          @gladiators.delete_at(0) if response == "y"
          @gladiators.delete_at(1) if response == "n"

      elsif beats[@gladiators[0].weapon] != @gladiators[1].weapon
        puts "Finish him? (y/n)"
          response = gets.chomp
          @gladiators.delete_at(1) if response == "y"
          @gladiators.delete_at(0) if response == "n"
      end
    end
    return @gladiators
  end
end


      #First attempt to solve #fight method
      #Big thanks to Peter & Salil for kick ass refactoring help.

        # if weapon1 == "Trident" && weapon2 == "Spear"
        #   @gladiators.delete_at(1)
        # elsif weapon1 == "Trident" && weapon2 == "Club"
        #   @gladiators.delete_at(0)
        # elsif weapon1 == "Trident" && weapon2 == "Trident"
        #   @gladiators = []

        # elsif weapon1 == "Spear" && weapon2 == "Club"
        #   @gladiators.delete_at(1)
        # elsif weapon1 == "Spear" && weapon2 == "Trident"
        #   @gladiators.delete_at(0)
        # elsif weapon1 == "Spear" && weapon2 == "Spear"
        #   @gladiators = []

        # elsif weapon1 == "Club" && weapon2 == "Trident"
        #   @gladiators.delete_at(1)
        # elsif weapon1 == "Club" && weapon2 == "Spear"
        #   @gladiators.delete_at(0)
        # elsif weapon1 == "Club" && weapon2 == "Club"
        #   @gladiators = []
        # end

