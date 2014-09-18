require 'rails_helper'

RSpec.describe Feature, :type => :model do

	it " should have a name attribute " do
		expect(Feature).to respond_to(:name)
	end	
	it { should respond_to(:description) }
	it { should respond_to(:difficulty) }
	it { should validate_presence_of(:name) }

	it { should validate_presence_of(:description)}

	it { should validate_inclusion_of(:difficulty).to_allow([1,2,3,4,5]).on([:create, :update]) }

	it { should validate_numericality_of(:difficulty), only_integer: true }

end
