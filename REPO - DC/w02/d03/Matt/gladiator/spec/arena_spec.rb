require_relative '../lib/arena'
require_relative '../lib/gladiator'

describe Arena do
  let(:gladiator1) { Gladiator.new("Brick", "Trident") }
  let(:gladiator2) { Gladiator.new("Moe", "Spear") }
  let(:gladiator3) { Gladiator.new("Chris Brown", "Club") }
  let (:arena) { Arena.new("thunderdome") }

  # test initialization of arena name
  describe "::new" do

    it "should have a capitalizd arena name" do
      expect( arena.arena_name ).to eq("Thunderdome")
    end

  end

  describe "#add_gladiators" do

    it "should add be able to add a gladiator to the arena" do
      arena.add_gladiator(gladiator1)
      expect( arena.gladiators[0].name ).to eq(gladiator1.name)
    end

    it "should never have more than 2 gladiators in the arena" do
      arena.add_gladiator(gladiator1)
      arena.add_gladiator(gladiator2)
      arena.add_gladiator(gladiator3)
      expect( arena.gladiators.count ).to eq(2)
    end

  end

  describe "#battle" do
    context "there are 2 fighters in the arena" do

      it "should trident beats spear" do
        arena.add_gladiator(gladiator1)
        arena.add_gladiator(gladiator2)
        expect( arena.gladiators[0].weapon ).to eq("Trident")
      end

      it "should spear beats club" do
        arena.add_gladiator(gladiator2)
        arena.add_gladiator(gladiator3)
        expect( weapons.include?("Spear") ).to eq(true)
      end

      it "should club beats trident" do
        arena.add_gladiator(gladiator1)
        arena.add_gladiator(gladiator3)
        expect( arena.gladiators[2].weapon ).to eq("Club")
      end

      it "should make both gladiators lose if they have the same weapon" do
        arena.add_gladiator(gladiator1)
        arena.add_gladiator(gladiator1)
        expect( arena.gladiators[0].weapon ).to eq(nil)
      end

    end

  end

end
