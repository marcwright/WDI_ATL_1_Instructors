require_relative '../lib/arena'
require_relative '../lib/gladiator'
require_relative 'gladiator_spec'

describe Arena do
  let(:a) {Arena.new("colosseum")}
  let(:g1) {Gladiator.new("Maximus", "trident")}
  let(:g2) {Gladiator.new("Commodus", "spear")}
  let(:g3) {Gladiator.new("Antonius", "club")}

  describe "::new" do
    it "should set the provided name" do
      expect(a.name.length).to be > 0
    end
    it "should have a capitalized name" do
      expect(a.name). to eq "Colosseum"
    end
  end

  describe "#add_gladiators" do
    it "should add a gladiator to the arena" do
      a.add_gladiators(g1)
      expect(a.gladiators.length).to be > 0
    end
  end

  describe "#fight" do
    it "should allow the gladiator with the trident to beat the gladiator with the spear" do
      a.add_gladiators(g1)
      a.add_gladiators(g2)
      a.fight
      expect(a.gladiators.length).to eq(1)
    end

    it "should allow the gladiator with the spear to beat the gladiator with the club" do
      a.add_gladiators(g2)
      a.add_gladiators(g3)
      a.fight
    end

    it "should allow the gladiator with the club to beat the gladiator with the trident" do
      a.add_gladiators(g3)
      a.add_gladiators(g1)
      a.fight
    end
  end
end
