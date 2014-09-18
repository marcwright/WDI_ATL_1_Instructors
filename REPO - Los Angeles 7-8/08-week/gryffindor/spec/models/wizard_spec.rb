require 'rails_helper'

RSpec.describe Wizard, :type => :model do
  it 'is invalid without a first name' do
  	unnamed = Wizard.new(last_name: "Wizard", house: "Hufflepuff", is_muggle: false)
  	expect(unnamed).to be_invalid
  end
  it 'is invalid without a last name' do
  	unlastnamed = Wizard.new(first_name: "Anonymous", house: "Hufflepuff", is_muggle: false)
  	expect(unlastnamed).to be_invalid
  end
  it 'is invalid without a house' do
  	unsorted = Wizard.new(first_name: "Anonymous", last_name: "Wizard", is_muggle: false)
  	expect(unsorted).to be_invalid
  end
  it 'is invalid if is_muggle has not been set' do
  	squib = Wizard.new(first_name: "Anonymous", last_name: "Wizard", house: "Hufflepuff")
  	expect(squib).to be_invalid
  end
  describe "#full_name" do
  	it "returns the wizard's full name (first and last) as a string" do
  		harry = Wizard.new(first_name: "Harry", last_name: "Potter")
  		expect(harry.full_name).to eq "Harry Potter"
  	end
  end
  describe "#full_name_with_initial" do
  	it "return the wizard's first name, middle initial, and last name ( if the wiz has a middle name)"do
  		hermione = Wizard.new(first_name: "Hermione", last_name: "Granger", middle_name: "Jean")
  		expect(hermione.full_name_with_initial).to eq "Hermione J. Granger"
  	end
  end
end
