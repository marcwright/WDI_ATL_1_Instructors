require_relative '../lib/gladiator'
require_relative '../lib/arena'
require 'pry'

describe Arena do
  let(:arena_1) do
    Arena.new("thunderdome")
  end

  describe "::new" do
    it "All arenas should have a Capitalized name." do
      expect( arena_1.name ).to eq "Thunderdome"
    end
   end


  describe "#have_gladiator" do
    it "The arena can HAVE gladiators." do
      gonzo = Gladiator.new("Gonzo", "trident")
      arena_1.arena.push(gonzo)
      expect( arena_1.arena[0].class ).to eq(Gladiator)
    end
   end

   describe "#add_to_arena" do
    it "You can ADD a gladiator to the arena;" do
      gonzo = Gladiator.new("Gonzo", "trident")
      num_gladiators = arena_1.arena.length
      arena_1.add_to_arena(gonzo)
      num_gladiators_2 = arena_1.arena.length
      expect( num_gladiators_2 - num_gladiators ).to eq(1)
    end
   end

    describe "#fight" do
    it "You need TWO gladiators to call a fight;" do
      bonzo = Gladiator.new("Bonzo", "trident")
      arena_1.add_to_arena(bonzo)

      expect( arena_1.fight ).to eq("You need two gladiators to call a fight!") 
    end
   end

   describe "#add_to_arena" do
    it "The arena CANNOT have more than two gladiators at a time" do
      bonzo = Gladiator.new("Bonzo", "trident")
      jango = Gladiator.new("Jango", "spear")
      winslo = Gladiator.new("Winslo", "club")
      arena_1.add_to_arena(bonzo)
      arena_1.add_to_arena(jango)
      expect( arena_1.add_to_arena(winslo) ).to eq("You cannot add more than two gladiators at a time!")
    end
   end

   describe "#fight" do
    it "You CAN call a FIGHT if there are more than two gladiators in the arena, eliminating one;" do
      bonzo = Gladiator.new("Bonzo", "trident")
      jango = Gladiator.new("Jango", "spear")
      arena_1.add_to_arena(bonzo)
      arena_1.add_to_arena(jango)
      #binding.pry
      arena_1.fight
      expect( arena_1.arena[0].name ).to eq("Bonzo") #Bonzo kills Jango
    end
   end

   

   describe "#fight" do
    it "You can call a FIGHT, eliminating one - spear beats club;" do
      winslo = Gladiator.new("Jango", "spear")
      jango = Gladiator.new("Winslo", "club")
      arena_1.add_to_arena(winslo)
      arena_1.add_to_arena(jango)
      arena_1.fight
      
      expect( arena_1.arena[0] ).to eq jango #Jango spear beats Winslo club
    end
   end

   describe "#fight" do
    it "You can call a FIGHT, eliminating one - club beats trident;" do
      winslo = Gladiator.new("Jango", "club")
      jango = Gladiator.new("Winslo", "trident")
      arena_1.add_to_arena(winslo)
      arena_1.add_to_arena(jango)
      arena_1.fight
      
      expect( arena_1.arena[0].name).to eq "Jango" #Jango spear beats Winslo club
    end
   end






end