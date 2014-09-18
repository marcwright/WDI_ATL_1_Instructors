require_relative '../lib/gladiator'
require_relative '../lib/arena'
require_relative 'arena_spec'

describe Gladiator do
  let(:g1) {Gladiator.new("Maximus", "trident")}
  let(:g2) {Gladiator.new("Commodus", "spear")}
  let(:g3) {Gladiator.new("Antonius", "club")}
  describe "::new" do
    it "should set the provided name" do
      expect(g1.name).to eq "Maximus"
    end
    it "should set the provided weapon" do
      expect(g3.weapon).to eq "club"
    end
  end
end


