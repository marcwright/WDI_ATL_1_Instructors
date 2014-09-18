require_relative "../lib/cell"

describe Cell do
  let(:cell) {Cell.new(2, 1)}

  describe "::new" do
    it "has a value of true upon instantiation" do
      expect(cell.alive).to eq(true)
    end
    it "assigns an x and y value to a new cell" do
      expect(cell.x).to eq 2
    end

  # describe "#add" do

  #   it "can add a cell to an array" do
  #     cell.add
  #     expect( grid.board ).to include(cell)
  #   end
  # end
end






end
