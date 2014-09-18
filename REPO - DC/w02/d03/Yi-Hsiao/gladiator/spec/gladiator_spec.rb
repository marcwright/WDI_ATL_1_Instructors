require "spec_helper"
require_relative "../lib/gladiator"
require_relative "../lib/arena"

describe Gladiator do
  let( :gladiator ) { Gladiator.new( "Blue Team Gladiator", "Standard Blade" )}

  describe "::new" do
    it "starts with a name" do
      expect( gladiator.name ).to eq( "Blue Team Gladiator" )
    end

    it "starts with a weapon" do
      expect( gladiator.weapon ).to eq( "Standard Blade" )
    end
  end
end
