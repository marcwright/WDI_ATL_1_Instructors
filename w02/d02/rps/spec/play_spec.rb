require "spec_helper"
require_relative '../lib/play'

describe "#rps" do
  let(:player_one) { { name: "Marc", play: "scissors" } }
  let(:player_two) { {name: "Peter", play: "rock"} }

  context "player one wins" do
    before { player_one[:play] = "paper" }

    it "wins" do
      expect(rps(player_one, player_two)).to eq("Marc wins!")
    end
  end

  context "player two wins" do
    it "wins" do
      expect(rps(player_one, player_two)).to eq("Peter wins!")
    end
  end
  
  context "tie" do
    before { player_two[:play] = "scissors" }

    it "ties" do
      expect(rps(player_one, player_two)).to eq("Tie!")
    end
  end
end