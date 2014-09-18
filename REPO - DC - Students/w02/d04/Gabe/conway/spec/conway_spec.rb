require 'spec_helper'
require 'pry'
require_relative "../lib/conway"

describe Game do
	
end

describe Cell do	
		
	let (:cell) {Cell.new(2, 2)}
		it "can hold coordinates" do
			expect(cell.coordinates).to eq("2, 2")
		end
end

