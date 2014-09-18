require_relative "../lib/arena.rb"

describe Arena do
  let (:thunderdome){ Arena.new("Thunderdome", [
    Gladiator.new("Richard", "Trident")]) }

  describe "::new" do
    it "should set the Arena name. Capitalized" do
      expect( thunderdome.name ).to eq("Thunderdome")
    end

    it "should have gladiators." do
      expect( thunderdome.gladiators[0].name ).to eq("Richard")
    end
  end

  context "Adding gladiators" do

    describe "#add_gladiator" do
      it "should add a gladiator to the Arena" do
        thunderdome.add_gladiator("Randy", "Club")
        expect( thunderdome.gladiators.last.name ).to eq("Randy")
      end

      it "should never have more than 2 gladiators" do
        thunderdome.add_gladiator("Randy", "Club")
        expect( thunderdome.add_gladiator("Peter", "Spear") ).to eq("ERROR: Too many gladiators! There's already two.")
      end
    end
  end

  describe "#fight" do
    it "should have two gladiators fight if there are two gladiators." do
      thunderdome.add_gladiator("Randy", "Club")
      expect( thunderdome.fight ).to eq("Randy wins!!!")
    end
  end
end
