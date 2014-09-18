require_relative "../lib/cell"
require_relative "../lib/grid"

describe Cell do
  let ( :cell ){ Cell.new(2,3) }
  describe "::new" do
    it "Creates a new instance of cell"do
      expect( cell.status ).to eq(true)
    end
  end
end

describe Grid do
  let( :grid ){ Grid.new }
  let ( :cell ){ Cell.new(2,3) }
  describe "::new" do
    it "creates a grid" do
      expect grid == Grid.new
    end
  end

  describe "#add_cell" do
    it "should push a live cell into array" do
      grid.add_cell(cell)
      expect( grid.grid_array.last.status ).to eq(true)
    end
  end

 describe "#live_neighbors" do
  it "surveys the cells around a cell and returns the number of live cells" do
    expect( grid.live_neighbors(cell) ).to eq(0)
   end
 end

 describe "#tick_result" do
  it "evaluates the number of live neighbors, and kills cells if it has less than two live neighbors" do
    cell3 = Cell.new(1,3)
    grid.add_cell(cell3)
    grid.tick_result(cell3)
    expect(grid.grid_array.status).to eq(false)
  end
end

end
