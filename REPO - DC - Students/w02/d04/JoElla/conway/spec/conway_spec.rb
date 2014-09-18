 require_relative "../lib/conway"


describe Game do

let(:game) { Game.new }

  describe "::new" do
    it "has a hash with four elements" do
      expect( game.positions.length ).to eq(4)
    end
  end

  describe "#find_neighbors" do
    expect( game.find_neighbors(1.1) ).to eq(0)
  end
end
