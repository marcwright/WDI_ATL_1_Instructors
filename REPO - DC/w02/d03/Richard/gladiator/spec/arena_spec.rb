require_relative '../lib/gladiator'
require_relative '../lib/arena'
require 'pry'


describe Arena do
  let(:arena) do
    Arena.new("Slaughterhouse",[
      Gladiator.new('Inhak', 'Trident'),
      Gladiator.new('Richard', 'Machine Gun')
      ])
  end

  describe "::new" do
    it "should have a name with the ability to have gladiators" do
      expect( arena.name ).to eq("Slaughterhouse")
    end
  end

  describe "#add_gladiator" do
    it "should add a gladitor to the list of gladiators" do
      arena.add_gladiator(Gladiator.new("Richard", "Machine Gun"))
      arena.add_gladiator(Gladiator.new('Richard', 'Machine Gun'))
      expect( arena.gladiators[1].name ).to eq("Richard")
    end

    it "should not have more than 2 gladiators" do
      expect( arena.add_gladiator(["Richard", "Machine Gun"]) ).to eq("Only 2 at a time!")
    end
  end

  describe "#fight" do
    it "allows gladiators to fight" do
      arena.add_gladiator(Gladiator.new("Richard", "Machine Gun"))
      arena.add_gladiator(Gladiator.new('Inhak', 'Octident'))
      expect( arena.fight ).to eq("Richard wins with Machine Gun!")
    end
  end
end
