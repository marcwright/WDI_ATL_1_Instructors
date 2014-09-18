require "spec_helper"
require_relative "../lib/gladiator"
require_relative "../lib/arena"

describe Gladiator do
  let( :gman ) { Gladiator.new( "Batman", "Grapling Hook" ) }

  describe ":gman" do
    it "Gladiator has a name" do
      expect( gman.name ).to eq( "Batman" )
    end
  end

  it "A gladiator has a weapon" do
    expect( gman.weapon ).to eq( "Grapling Hook" )
  end

end

# describe "A gladiator has a name" do
#   it ""
# end
