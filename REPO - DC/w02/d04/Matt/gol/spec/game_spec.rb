require_relative "../lib/game"

describe Cell do
let (:cell_1) { Cell.new(-1, -2) }
let (:cell_2) { Cell.new(-1, -1) }

  #begin tests
  describe "::new" do
    it "A cell has an x coordinate variable." do
      expect( cell_1.x_coord).to eq -1
    end

    it "A cell has a y coordinate variable." do
      expect( cell_1.y_coord).to eq -2
    end
  end

end

describe Game do
  let (:game) {Game.new([])}

  describe "::new" do
    it "should have an array that holds cells" do
      expect( game.cells ).to eq ([])
    end
  end

end
