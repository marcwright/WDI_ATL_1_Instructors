require_relative '../lib/gladiator'
require 'pry'


describe Gladiator do
  let(:glad) { Gladiator.new("Max", "Spear") }

  describe "::new" do
    it "should instantiate a gladiator with a name and weapon" do
      expect( glad.name ).to eq"Max"
    end
  end


end
