require_relative '../lib/gladiator'
require_relative '../lib/arena'

describe Gladiator do
  let(:gladiator) { Gladiator.new('John', 'Trident')}

  describe '::new' do
    it "should have a name" do
      expect( gladiator.name ).to eq ('John')
    end
    it "should have a weapon" do
      expect( gladiator.weapon ).to eq('Trident')
    end
  end
end

