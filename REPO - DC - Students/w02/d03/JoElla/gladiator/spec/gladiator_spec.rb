require_relative '../lib/gladiator'

describe Gladiator do
  let (:gus) { Gladiator.new("Gus", "club")}

  describe "::new" do
    it "should have a name" do
      expect( gus.name ).to eq("Gus")
    end

    it "should have a weapon" do
      expect( gus.weapon ).to eq("club")
    end

  end #end ::new


end
