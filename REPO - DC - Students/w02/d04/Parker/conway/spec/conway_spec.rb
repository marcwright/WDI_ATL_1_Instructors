require_relative '../lib/conway'

describe Cell do
	
	it "should be created with X and Y coordinates" do
		cell = Cell.new(0 ,0)
		expect( cell.x ).to be 0
		expect( cell.y ).to be 0
	end

	it "should be defaulted to alive" do
		cell = Cell.new(0, 0)
		expect( cell.alive? ).to be_truthy
	end

	it "should allow alive status to be passed as an initializer argument" do
		cell = Cell.new(0, 0, false)
		expect( cell.alive? ).to be_falsy 
	end

	it "should define an 'update' method that returns its 'alive?' status" do
		cell = Cell.new(0, 0, true)
		expect( cell.update() ).to eq cell.alive?
	end
end