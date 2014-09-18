require_relative '../lib/grid'

describe Grid do
  it "can be instantiate with a given hash of cells" do
    cells = {}
    grid = Grid.new(cells)

    expect( grid.cells ).to be(cells)
  end

  describe "#get_cell" do
    it "should get the alive status for a specified coordinate" do
      grid = Grid.new({'0_0' => true})
      expect( grid.get_cell(0, 0) ).to be_truthy
    end
  end

  describe "#set_cell" do
    it "should set the alive status of a specified coordinate"  do
      grid = Grid.new
      grid.set_cell(0, 1, true)
      expect(grid.get_cell(0,1)).to be_truthy
    end
  end

  describe "#key_reverse" do
    it "should take key and parse x and y values into integers" do
      grid = Grid.new
      key = grid.key_reverse("3_2")
      expect( key ).to eq([3,2])
    end
  end

  context "#next" do
    it "should replace the current cells instance with a new hash" do
      grid = Grid.new
      old_cells = grid.cells
      grid.next
      expect( grid.cells ).to_not be(old_cells)
    end

    it "expect the new_grid value to have nine cells" do
      grid = Grid.new({'0_0' => true})
      grid.next
      expect( grid.cells.size ).to eq(9)
    end

    it "expect three living cells to active a fourth" do
      grid = Grid.new()
      grid.set_cell(0, 0, true)
      grid.set_cell(0, 1, true)
      grid.set_cell(1, 1, true)
      grid.next
      expect( grid.cells.size ).to eq(9)
    end

  end


end
