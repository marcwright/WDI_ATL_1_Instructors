require_relative '../lib/gladiator'

describe Gladiator do
  let (:gladiator_1) { Gladiator.new("Gandalf", "Axe") }

  describe "#name" do
    it "the gladiator has a name" do
      expect( gladiator_1.name ).to eq "Gandalf"
    end
   end

  describe "#weapon" do
    it "the gladiator has a weapon" do
      expect( gladiator_1.weapon ).to eq "Axe"
    end
   end

 end