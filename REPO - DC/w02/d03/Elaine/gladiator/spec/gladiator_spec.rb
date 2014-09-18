require_relative '../lib/gladiator'

describe Gladiator do
  let ( :gladiator1 ) { Gladiator.new("Max", "Trident")}
  let ( :gladiator2 ) { Gladiator.new("Cesar", "Spear")}

  describe "::new" do
    it "should have a name" do
      expect( gladiator1.name ).to eq "Max"
    end

    it "should have a weapon" do
      expect( gladiator1.weapon ).to eq "Trident"
    end

  end


end # ends Gladiator class
