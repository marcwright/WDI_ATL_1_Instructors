require_relative '../lib/gladiator'

describe Gladiator do
  let (:gladiator) { Gladiator.new("Joseph", "spear") }
  describe "::new" do
    it "should have a name" do
      expect( gladiator.name ).to be_truthy
    end
    it "should have a weapon" do
      expect( gladiator.weapon ).to be_truthy
    end
  end #--ends describe ::new


end #--ends describe Gladiator class
