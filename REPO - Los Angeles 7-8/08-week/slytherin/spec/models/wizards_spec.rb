require 'rails_helper'

RSpec.describe Wizards, :type => :model do
  
  it 'is invalid without a first name' do
  	unamed = Wizards.new(last_name: "Wizard", house: "Hufflepuff", is_muggle: false)
  	expect(unamed).to be_invalid
  end

  it 'is invalid without a last name' do
  	unlastnamed = Wizards.new(first_name: "Anonymous", house: "Hufflepuff", is_muggle: false)
  	expect(unlastnamed).to be_invalid
  end

  it 'is invalid without a house' do
  	unsorted = Wizards.new(first_name: "Anonymous", last_name: "Wizard", is_muggle: false)
  	expect(unsorted).to be_invalid
  end

  it 'is invalid if is_muggle has not been set' do
  	squib = Wizards.new(first_name: "Anonymous", last_name: "Wizard", house: "Hufflepuff")
  	expect(squib).to be_invalid
  end

  describe "#full_name" do
  	it "returns the wizard's full name (first and last) as a string" do
  		harry = Wizards.new(first_name: "Harry" , last_name: "Potter")
  		expect(harry.full_name).to eq "Harry Potter"
  	end
  end

  describe "#full_name_with_initial" do
  	it "returns the wizards first name, middle initial, and last name (if the wizard has a middle name)" do
  		harry = Wizards.new(first_name: "Harry", last_name: "Potter", middle_name: "james")
  		expect(harry.full_name_with_initial).to eq "Harry J. Potter"
  	end
  end

end
