require_relative '../lib/gladiators'
require_relative '../lib/arena'

describe Gladiators do
  let(:gladiator) {Gladiators.new('maximus', 'trident')} # create gladiator object
  # and store it inside ':gladiator'

  describe "::new" do # when you initilize, use => :: 
    it "should set the gladiator name" do
      expect( gladiator.name ).to eq( "maximus") # instance method
    end
  end # - END of ::new
end # - END of Gladiator class
