require_relative '../lib/gladiator'

describe Gladiator do
  let (:spartacus){ Gladiator.new("Spartacus", "Spear")}

  describe "::new" do
    it "should set Gladiator's name" do
      expect( spartacus.name ).to eq("Spartacus")
    end

    it "should set the weapon" do
      expect( spartacus.weapon ).to eq("Spear")
    end
  end
end
