require 'spec_helper'
require_relative "../lib/blender.rb"

describe "Classroom1 Blender" do
	before	do
		@cr1Blender = Blender.new
	end
	it 'exist and is empty' do
		
		expect(@cr1Blender).to be_an_instance_of(Blender)
	end

	it 'has mango_orange juice' do
		
		expect(@cr1Blender.juice('mango_orange')).to eq('mango_orange')
	end

	it 'can have ingredients added to it' do
		
		expect(@cr1Blender.blend(['mango_orange','beer','kale','choc','chia_seeds','jawbreakers','laxatives','smooth_move_tea']).length).to eq(69)
	end

	it 'has a switch' do
		expect(@cr1Blender.switch).to eq(true)
	end

end