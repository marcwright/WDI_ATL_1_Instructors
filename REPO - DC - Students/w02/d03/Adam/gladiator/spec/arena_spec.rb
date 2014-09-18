require_relative '../lib/arena'
require_relative '../lib/gladiator'

describe Arena do
  let(:arena) { Arena.new('Washington')}
  let(:gladiator) {Gladiator.new('Adam', 'Cellphone')}
  let(:gladiator2) {Gladiator.new('Bob', 'Sword')}
  let(:gladiator3) {Gladiator.new('Carl', 'Stick')}

  describe '::new' do
    it "should have a name" do
      expect( arena.name ).to eq('Washington')
    end
    it "should have a capitalize name" do
      expect( arena.name ).to eq('Washington')
    end
    it "should have no gladiators" do
      expect( arena.gladiators ).to eq([])
    end
    it "can add gladiators to the arena" do
      arena.add_gladiator(gladiator)
      expect( arena.gladiators[0].name ).to eq( 'Adam' )
    end
    it "can never have more than two gladiators" do
      arena.add_gladiator(gladiator)
      arena.add_gladiator(gladiator2)
      arena.add_gladiator(gladiator3)
      expect( arena.gladiators.length ).to eq( 2 )
    end

    it "can initiate a fight with two fighters" do
      arena.add_gladiator(gladiator)
      arena.add_gladiator(gladiator)
      expect( arena.call_fight ).to eq ( nil )
    end
  end
end

