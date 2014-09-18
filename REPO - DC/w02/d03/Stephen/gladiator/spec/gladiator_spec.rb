# Stephen Stanwood (stephen@stanwoodsolutions.com)

require_relative "../lib/gladiator.rb"

describe Gladiator do
  context "::new" do
    let(:g) { Gladiator.new("Stephen", "Spear") }

    it "has the correct attributes" do
      expect( g.name ).to eq "Stephen"
      expect( g.weapon ).to eq "Spear"
    end
  end
end

describe Arena do
  let(:a) { Arena.new("oracle arena") }
  let(:first_w) { a.name.split.first }
  let(:second_w) { a.name.split.last }

   describe "::new" do
    it "has the 1st word capitalized" do
      expect( first_w ).to eq first_w.capitalize
    end

    it "has the 2nd word capitalized" do
      expect( second_w ).to eq second_w.capitalize
    end

    it "starts with no gladiators" do
      expect( a.gladiators ).to eq []
    end
  end

  describe "#add" do
    it "allows addition of a gladiator to the arena" do
      a.add("Tricia", "Trident")
      expect( a.gladiators.size ).to eq 1
    end

    it "does not allow additions beyond two gladiators" do
      3.times { a.add("Tricia", "Trident") }
      expect( a.gladiators.size ).to eq 2
    end
  end

  context "#fight" do
    it "does not allow fights with no gladiators" do
      expect( a.fight ).to be_falsey
    end

    it "does not allow fights with a single gladiator" do
      a.add("Tricia", "Trident")
      expect( a.fight ).to be_falsey
    end

    it "with two gladiators, same weapon removes both" do
      a.add("Tricia", "Trident")
      a.add("Tricia", "Trident")
      a.fight

      expect( a.gladiators.size ).to eq 0
    end

    it "Maximus wins" do
      a.add("Tricia", "Trident")
      a.add("Maximus", "Club")

      expect( a.entertained? ).to be_truthy
      a.fight

      expect( a.gladiators.size ).to eq 1
      expect( a.gladiators.first.name ).to eq "Maximus"
    end

    it "with two gladiators, Trident beats Spear" do
      a.add("Tricia", "Trident")
      a.add("Stephen", "Spear")
      a.fight

      expect( a.gladiators.size ).to eq 1
      expect( a.gladiators.first.name ).to eq "Tricia"
    end

    it "with two gladiators, Spear beats Club" do
      a.add("Stephen", "Spear")
      a.add("Caleb", "Club")
      a.fight

      expect( a.gladiators.size ).to eq 1
      expect( a.gladiators.first.name ).to eq "Stephen"
    end

    it "with two gladiators, Club beats Trident" do
      a.add("Caleb", "Club")
      a.add("Tricia", "Trident")
      a.fight

      expect( a.gladiators.size ).to eq 1
      expect( a.gladiators.first.name ).to eq "Caleb"
    end
  end
end
