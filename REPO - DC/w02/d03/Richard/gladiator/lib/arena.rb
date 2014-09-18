require_relative 'models/Gladiator'
class Arena
  attr_accessor :name, :gladiators

  def initialize(name, gladiators = [])
    @name =name
    @gladiators = gladiators
    @announce = "Welcome to the Slaughterhouse"
  end
 Arena.new("Slaughterhouse",[
      Gladiator.new('Richard', 'Machine Gun'),
      Gladiator.new('Inhak', 'Octident')
      ])

  def add_gladiator(new_gladiator)
    @gladiators.push(new_gladiator)
    if @gladiators.length > 2
      return @announce = "Only 2 at a time!"
    else
      return @announce = "Prepare to fight!"
    end
  end

  def fight
    if
      @gladiators[0].weapon == @gladiators[1].weapon
      return "TIE! YOU BOTH DIE"
    elsif
      @gladiators[0].weapon == 'Machine Gun' && @gladiators[1].weapon == "Octident"
      return "#{gladiators[0].name} wins with Machine Gun Wins!"
    elsif
      @gladiators[0].weapon == 'Club' && @gladiators[1].weapon == "Octident"
      return "#{@gladiators[1].name} wins with Octident!"
    elsif
      @gladiators[0].weapon == 'Club' && @gladiators[1].weapon == 'Machine Gun'
      return "#{@gladiators[1].name} wins! with Machine Gun!"
    elsif
      @gladiators[0].weapon == 'Machine Gun' && @gladiators[1].weapon == 'Club'
      return "#{@gladiators[0].name} wins with Machine Gun!"
    elsif
      @gladiators[0].weapon == "Octident" && @gladiators[1].weapon == 'Club'
      return "#{@gladiators[0].name} wins with Octident!"
    else
      @gladiators[0].weapon == "Octident" && @gladitors[1].weapon == 'Machine Gun'
      return "#{@gladiators[1].name} wins with Machine Gun!"
    end
  end
end
