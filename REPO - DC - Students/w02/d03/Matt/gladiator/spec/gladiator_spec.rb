require_relative '../lib/gladiator'

describe Gladiator do
  let (:gladiator) { Gladiator.new("Max", "Hammer") }

  # test initialization
  describe "::new" do
    it "should have a name" do
      expect( gladiator.name ).to eq "Max"
    end

    it "should have a weapon" do
      expect( gladiator.weapon ).to eq "Hammer"
    end
  end

end
