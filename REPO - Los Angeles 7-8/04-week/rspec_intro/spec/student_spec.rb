require 'spec_helper'
require_relative '../lib/ga_student'

describe 'A GA student in WDI 7-8' do

	before do
		@student = GA_student.new
	end

	it 'should have a first name' do
		expect(@student.first_name).to eq('brant')
	end

	it 'should have a last name' do
        expect(@student.last_name).to eq('barger')
	end

	it 'should give us back a proper capitalized full name' do

		expect(@student.full_name).to eq('Brant Barger')
	end 
end


