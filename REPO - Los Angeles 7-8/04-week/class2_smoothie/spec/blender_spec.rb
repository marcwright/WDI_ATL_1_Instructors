require 'spec_helper'
require_relative "../lib/blender.rb"



describe "A Blender" do
	before do
		@our_blender = Blender.new(false,false)
	end
	it 'exist' do
		expect(@our_blender).to be_an_instance_of(Blender)
	end

	it 'can receive ingredients'do
		ingredients=@our_blender.blend('spinach')
		expect(ingredients).to eq('spinach')
	end

 	it 'ready to blend' do
 		expect(@our_blender.ready_to_blend).to be true
 	end


	# xit 'step 7 serve' do
	# end
	
end

