require "pry"
require_relative "../lib/gladiator"
require_relative "../lib/arena"

describe Arena do
  let(:daves_stop_and_fight) do
     Arena.new("dave's stop and fight", ([
      Gladiator.new("Gus", "club"),
      Gladiator.new("Ricardo", "trident"),
      Gladiator.new("Smitty", "spear")
      ]))
   end



  describe "::new" do
    it "should have a name" do
      expect( daves_stop_and_fight.name ).to eq("Dave's Stop And Fight")
    end #have a name

    it "should have a capitalized name" do
      expect( daves_stop_and_fight.name ).to eq("Dave's Stop And Fight")
    end #cap name
  end #end ::new

  describe "#add_gladiator" do
    it "should put one gladiator in the arena" do
      daves_stop_and_fight.add_gladiator
      expect( daves_stop_and_fight.ring.count ).to eq(1)
    end

    it "should not allow more than two gladiators in the arena" do
      daves_stop_and_fight.add_gladiator
      daves_stop_and_fight.add_gladiator
      daves_stop_and_fight.add_gladiator
      expect( daves_stop_and_fight.status ).to eq("That's too many")
    end
  end #add_gladiator

  describe "#fight" do
    it "should only be able to activate if ring has 2 gladiators" do
      daves_stop_and_fight.add_gladiator
      expect( daves_stop_and_fight.fight ).to eq("I can't fight myself")
    end

    it "should delete the losing fighter" do
      daves_stop_and_fight.add_gladiator
      daves_stop_and_fight.add_gladiator
      daves_stop_and_fight.fight
      expect( daves_stop_and_fight.ring.count ).to eq(1)
    end

  end #fight

end

