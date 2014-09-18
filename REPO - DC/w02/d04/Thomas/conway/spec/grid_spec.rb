require_relative "../lib/grid"
require_relative "../lib/cell"
describe Grid do
  let (:grid) {Grid.new}
  let(:cell) {Cell.new(2,1, false)}
  let(:c2) {Cell.new(3,1)}
  let(:c3) {Cell.new(4,1, false)}

  describe "::new" do
    it "creates an empty array" do
      expect(grid.class).to eq(Grid)
    end
  end

  describe "#add" do
    it "adds a cell to the board" do
      grid.add(cell)
      expect(grid.board[0]).to eq cell
    end
  end

  describe "#has_neighbor?" do
    it "should determine is adjacent cell is alive"
  end
end
