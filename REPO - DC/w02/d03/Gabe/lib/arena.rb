require 'pry'

class Arena
  attr_accessor :name, :roster, :arena

  def initialize(name='defaultname')
    @name = name.capitalize
    @arena= []
  end


 def have_gladiator(name, weapon) #CREATES and adds gladiator to roster
    new_to_add = Gladiator.new(name, weapon)
    @roster = new_to_add
    return "Gladiator #{new_to_add} added to arena roster."
  end



  def add_to_arena(which_one) 

    if arena[1] == nil
    	arena.push(which_one)
     	return "added #{which_one} to arena."
	else 
		return "You cannot add more than two gladiators at a time!"
	
  end

end



  def fight

  	
    if @arena.length < 2
      
      return "You need two gladiators to call a fight!"
    end

    

    	battler1 = arena[0].weapon #gets the weapons of the two battlers
    	battler2 = arena[1].weapon

      
    	###################################### trident
    	if battler1  == "trident"
	
    	elsif battler2 == "spear"
    		arena.pop
	
    	elsif battler2 == "club"
    		arena.shift
	
    	elsif battler2 == "trident"
    		return "Its a draw! All gladiators die!"
    		arena = []
    	else 
    	  return "unknown weapons!"
    	end
    	###################################### spear
    	if battler1 == "spear"
	
    	elsif battler2 == "club"
    		arena.pop
	
    	elsif battler2 == "trident"
    		arena.shift
	
    	elsif battler2 == "spear"
    		return "Its a draw! All gladiators die!"
    		arena = []
    	else 
    	  return "unknown weapons!"
    	end
	
    	###################################### club
    	if battler1  == "club"
        binding.pry
	
    	elsif battler2 == "trident"
    		arena.pop
	
    	elsif battler2 == "spear"
    		arena.shift
	
    	elsif battler2 == "club"
    		return "Its a draw! All gladiators die!"
    		arena = []
    	else 
    	  return "unknown weapons!"
    	end

   	
		#return "You need two gladiators to call a fight!"
	#end

  end # end battle method




 end # end class