require_relative '../lib/gladiator'

describe Gladiator do
let (:gladiator) { Gladiator.new("Pullo", "axe") }
  describe "::new" do
    it "set the gladiator's name" do
      expect( gladiator.name ).to eq "Pullo"
    end
    it "should set the gladiator's weapon" do
      expect( gladiator.weapon ).to eq "axe"
    end
  end
end
