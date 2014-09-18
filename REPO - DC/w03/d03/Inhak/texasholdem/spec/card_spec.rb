require_relative '../lib/card'

describe Card do
  let( :card ) { Card.new("Q", "S")}
  describe "::new" do
    it "should show the card's suit" do
      expect( card.suit ).to eq("S")
    end
  end
end
