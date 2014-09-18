class Arena
  attr_reader :name, :gladiators

  def initialize( name )
    @name = name.capitalize
    @gladiators = []
    @max_capacity = 2
    # trident beats spear, spear beats club, club beats trident
    @priority = ["Trident", "Spear", "Club", "Trident"]
    @maximus_present = false
  end

  def add_gladiator( gladiator )
    @gladiators << gladiator if @gladiators.length < 2
    @maximus_present = true if gladiator.name == "Maximus"
  end

  def fight
    glad_weapons = @gladiators.map{ |fighter| fighter.weapon }
    if @maximus_present
      @gladiators.delete_if { |fighter| fighter.name != "Maximus" }
    # checks if weapons are the same and eliminate both fighters
    elsif glad_weapons.uniq.length == 1
      @gladiators = []
    else
      # looks for where in the priority queue there are two consecutive true values and returns the losing_weapon
      search_weapons = @priority.chunk { |weapon| glad_weapons.include?( weapon )}
      losing_weapon = search_weapons.select{ |result| result[0] == true && result[1].length == 2 }[0][1][1]

      # eliminates the losing gladiator
      puts "Do you wish to save the gladiator (Thumbs up/down)?"
      vote = gets.chomp.downcase
      if vote == "thumbs down"
        @gladiators.delete_if { |fighter| fighter.weapon == losing_weapon }
      elsif "thumbs up"
        @gladiators.delete_if { |fighter| fighter.weapon != losing_weapon }
      end
    end
  end

  def remove_name( name )
    @gladiators.delete_if { |fighter| fighter.name.casecmp( name ) == 0 }
  end

  def entertained?
    return @maximus_present
  end
end
