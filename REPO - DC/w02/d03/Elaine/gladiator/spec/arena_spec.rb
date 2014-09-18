require_relative '../lib/gladiator'
require_relative '../lib/arena'
# require_relative 'gladiator_spec'

describe Arena do
  let( :arena ) { Arena.new("The Colosseum")}
  let( :arena2 ) { Arena.new("the boxing ring")}
  let( :gladiator1 ) { Gladiator.new("Max", "Trident")}
  let( :gladiator2 ) { Gladiator.new("Cesar", "Spear")}
  let( :gladiator3 ) { Gladiator.new("Achilles", "Club")}
  let( :gladiator4 ) { Gladiator.new("George", "Spear")}

  describe "::new" do
    it "should have a name" do
      expect( arena.name ).to eq("The Colosseum")
    end

    it "should have a capitalized name" do
      expect( arena2.name ).to eq("The Boxing Ring")
    end

  end # ends initialize

  describe "#add_gladiator" do
    it "should add a gladiator to the arena" do
      arena.add_gladiator(gladiator2)
      expect( arena.gladiators.last.name ).to eq("Cesar")
    end

    it "should not add more than 2 gladiators to the arena" do
      arena.add_gladiator(gladiator1)
      arena.add_gladiator(gladiator2)
      arena.add_gladiator(gladiator3)
      expect( arena.gladiators.last.name ).to eq("Cesar")
    end
  end # ends add_gladiator

  describe "#fight" do

    context "when gladiators 1 and 2 are in the arena" do
      before do
        arena.add_gladiator(gladiator1)
        arena.add_gladiator(gladiator2)
        arena.fight
      end

      it "should eliminate one gladiator if there are two gladiators in the arena" do
        expect( arena.gladiators.length ).to eq(1)
      end

      it "should allow gladiator with the Trident to beat the one with the Spear" do
        expect( arena.gladiators[0].name ).to eq("Max")
      end
    end

    it "should allow gladiator with the Spear to beat the one with the Club" do
      arena.add_gladiator(gladiator2)
      arena.add_gladiator(gladiator3)
      arena.fight
      expect( arena.gladiators[0].name ).to eq("Cesar")
    end

    it "should allow gladiator with the Club to beat the one with the Trident" do
      arena.add_gladiator(gladiator1)
      arena.add_gladiator(gladiator3)
      arena.fight
      expect( arena.gladiators[0].name ).to eq("Achilles")
    end

    it "should eliminate both gladiators if they have the same weapon" do
      arena.add_gladiator(gladiator2)
      arena.add_gladiator(gladiator4)
      arena.fight
      expect( arena.gladiators.length ).to eq(0)
    end

    it "should do nothing if there are less than 2 gladiators in the arena" do
      arena.add_gladiator(gladiator1)
      arena.fight
      expect( arena.gladiators.length ).to eq(1)
    end

  end # ends fight

end
