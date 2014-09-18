require './lib/makechange.rb'

describe ChangeMachine do
  describe "::new" do
    let (:transaction) { ChangeMachine.new }
    it "instantiates a new transaction with balance of 0" do
      expect(transaction.balance).to eq(0)
    end
    it "creates an empty hash with coin counts" do
      expect(transaction.coin_count).to eq({})
    end
    describe "#make_change" do
      it "adds a quarter for each 25c subtracted" do
        transaction.make_change
        expect(transaction.coin_count[:quarter]).to eq(1)
      end
      it "adds a dime for each 10c subtracted" do

      end
      it "adds a nickel for each 5c subtracted" do

      end
      it "adds a penny for each 1c subtracted" do

      end
      it "keeps running until the balance is 0" do

      end
    end
  end
end
