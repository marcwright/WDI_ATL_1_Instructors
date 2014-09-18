require_relative "../lib/arena"
require_relative "../lib/gladiator"

describe Arena do

  let(:arena1) {Arena.new("Pokemon Stadium")}
  let(:fighter1) {Gladiator.new("george", "trident")}
  let(:fighter2) {Gladiator.new("bob", "spear")}
  let(:fighter3) {Gladiator.new("joe", "club")}


  it "has a name" do
    expect( arena1.name ).to eq("Pokemon Stadium")
  end

  it "can have gladiators" do
    expect( arena1.combatants ).to eq([])
  end

  describe "#add_gladiator" do
    it "adds a gladiator" do
      arena1.add_gladiator(fighter1)
      expect( arena1.combatants ).to include(fighter1)
    end

    it "should never have more than two combatants at once" do
      arena1.add_gladiator(fighter1)
      arena1.add_gladiator(fighter2)
      arena1.add_gladiator(fighter3)
      expect( arena1.combatants.count ).to eq(2)
    end
  end

  describe "#fight" do

    it "cues the gladiators to fight if there are two present" do
      arena1.add_gladiator(fighter1)
      arena1.add_gladiator(fighter2)
      arena1.add_gladiator(fighter3)
      expect(arena1.fight(fighter1, fighter2)).to eq(fighter1)
    end
  end

end
