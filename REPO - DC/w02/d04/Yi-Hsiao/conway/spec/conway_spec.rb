require "spec_helper"
require_relative "../lib/conway"

# be more descriptive about the class, e.g. game
describe Conway do
  subject(:game) { Conway.new }

  describe "#add_cell" do
    it "adds a living cell and stores its X, Y coordinate" do
      x_pos = 1
      y_pos = 1
      game.add_cell(x_pos, y_pos)
      # be sure to label and explain any new concepts
      expect(game.curr_phase[x_pos]).to include(y_pos)
    end

    it "can store the location of many living cells" do
      game.add_cell(-1, -1)
      game.add_cell(-1, 0)
      game.add_cell(0, 1)
      expect(game.curr_phase).to eq({ -1 => [-1, 0], 0 => [1] })
    end

    it "does not add a cell, if there is an existing cell in the same X, Y coordinate" do
      game.add_cell(0, 0)
      game.add_cell(0, 0)
      expect(game.curr_phase).to eq({ 0 => [0] })
    end
  end

  # could be better as a Cell instance method
  describe "#count_neighbors" do
    it "counts the number of adjacent cells to a specific coordinate" do
      game.add_cell(-1, -1)
      game.add_cell(-1, 0)
      game.add_cell(0, 1)
      expect(game.count_neighbors(0, 0)).to eq(3)
    end

    it "counts the number of adjacent cells without counting itself" do
      game.add_cell(-1, -1)
      game.add_cell(-1, 0)
      game.add_cell(0, 1)
      expect(game.count_neighbors(-1, -1)).to eq(1)
    end
  end

  describe "#will_live?" do
    it "decides a cell will die, if it has less than 2 neighbors" do
      game.add_cell(-1, -1)
      game.add_cell(-1, 0)
      expect(game.will_live?(-1, -1)).to eq(false)
    end

    it "decides a cell will die, if it has more than 3 neighbors" do
      game.add_cell(-1, -2)
      game.add_cell(-1, -1)
      game.add_cell(-1, 0)
      game.add_cell(0, -1)
      game.add_cell(0, 0)
      expect(game.will_live?(-1, -1)).to eq(false)
    end

    it "decides a cell will live, if it has between 2 and 3 neighbors" do
      game.add_cell(-1, -2)
      game.add_cell(-1, -1)
      game.add_cell(-1, 0)
      game.add_cell(0, -1)
      expect(game.will_live?(-1, -1)).to eq(true)
    end

    it "decides an empty space will become alive, if it has exactly 3 neighbors" do
      game.add_cell(-1, 0)
      game.add_cell(0, -1)
      game.add_cell(0, 0)
      expect(game.will_live?(-1, -1)).to eq(true)
    end
  end

  describe "#get_coords_to_scan" do
    it "returns x, y coordinates for all living cells and any empty spaces adjacent to a living cell" do
      game.add_cell(0, 0)
      expect(game.get_coords_to_scan).to eq({-1 => [-1, 0, 1], 0 => [-1, 0, 1], 1 => [-1, 0, 1]})
    end
  end

  describe "#update_phase" do
    it "creates a list of where the living cells will be in the next phase" do
      game.add_cell(-1, 0)
      game.add_cell(0, -1)
      game.add_cell(0, 0)
      game.update_phase
      expect(game.curr_phase).to eq({-1 => [-1, 0], 0 => [-1, 0]})
    end

    it "can reach a standstill" do
      game.add_cell(-1, 0)
      game.add_cell(0, -1)
      game.add_cell(0, 0)
      game.update_phase
      game.update_phase
      expect(game.curr_phase).to eq({-1 => [-1, 0], 0 => [-1, 0]})
    end
  end
end
