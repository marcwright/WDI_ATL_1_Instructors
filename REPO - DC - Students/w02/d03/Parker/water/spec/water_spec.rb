require 'spec_helper'
require_relative "../lib/water"
	
	describe WaterBottle do
		it "is empty when created" do
			wb = WaterBottle.new
			expect(wb.is_empty?).to eq(true)
		end

	it "can be filled" do
			wb = WaterBottle.new
			wb.fill
			expect(wb.is_empty?).to eq (false)
		end

	context "when it's full" do
		let (:wb) ( WaterBottle.new)
		before do 
			wb.fill
		end

	it "can dispense water" do
		wb.dispense
		expect(wb.dispense).to eq("Water")
		end

	context "when empty" do
		it "can't dispense water" do
		wb = WaterBottle.new
		expect(wb.d)
	end

end



	# let ( :wb){ WaterBottle.new}

	# describe "::new"  do
	# 	it "starts empty" do
	# 		expect( wb.empty? ).to be_true
	# 		end
	# end

	# describe "#empty" do
	# 	it "fill the wb"
	# 		wb.fill!
	# 		expect ( wb.full? ).to be_false
	# 	end
	# 