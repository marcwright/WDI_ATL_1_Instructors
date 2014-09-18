require_relative '../lib/deck'

describe Deck do
  let ( :deck ) { Deck.new }

  describe "#create_deck" do
    it "should make a 52 card deck." do
      expect( deck.create_deck ).to eq()
    end
  end

  describe "#deal_a_card" do
    it "should create a new instance of a deck." do
      expect( deck.deal_a_card )
    end
  end
end
