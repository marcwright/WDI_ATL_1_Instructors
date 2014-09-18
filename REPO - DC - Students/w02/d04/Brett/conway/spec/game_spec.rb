require_relative '../lib/game'

describe Game do
  let(:game) {Game.new}
  describe "::new" do
    it "should instantiate a new game" do
      expect(game.class).to eq(Game)
    end
    it "should create an empty array" do
      expect(game.live_cells).to eq([])
    end
  end

  describe "#add_cell" do
    it "should push coordinates to the array" do
      game.add_cell([0, 1])
      expect(game.live_cells.length).to eq(1)
    end
    it "should not push the coordinates if they already exist in the array" do
      game.add_cell([0, 1])
      game.add_cell([0, 1])
      expect(game.live_cells.length).to eq(1)
    end
  end

  describe "#count_neighbors" do
    before do
      game.add_cell([1, 2])
      game.add_cell([2, 1])
      game.add_cell([2, 2])
    end
    it "should count any adjacent living live_cells" do
      expect(game.count_neighbors([2, 2])).to eq(2)
    end
  end

  describe "tick" do
    before do
      game.add_cell([1, 1])
      game.add_cell([2, 2])
    end

    it "should map cells that die to an array called dead_cells" do
      game.tick
      expect(game.dead_cells).to eq(1)
    end
    it "should delete the cell if count_neighbors < 2" do
      game.tick
      expect(game.live_cells.length).to eq(1)
    end
  end
end
