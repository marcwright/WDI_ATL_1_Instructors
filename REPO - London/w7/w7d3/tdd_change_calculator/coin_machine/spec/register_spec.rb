require 'spec_helper'
require_relative "../register"

describe Register do
 before :each do
    @register_with_100_of_each_coin = Register.new(200 => 100, 100 => 100, 50 => 100, 20 => 100, 10 => 100, 5 => 100, 2 => 100, 1 => 100)
    @register_with_no_50_or_5p_coins = Register.new(200 => 100, 100 => 100, 20 => 100, 10 => 100, 2 => 100, 1 => 100)
 end

  describe '#new' do
    it "instantiates a new register" do
      expect(@register_with_100_of_each_coin).to be_an_instance_of(Register)
    end
  end

  describe "#coin_denominations" do
    it "returns an array of coin denominations" do
      expect(@register_with_100_of_each_coin.coin_denominations).to eql [200, 100, 50, 20, 10, 5, 2, 1]
    end

    it "doesn't matter what order the coins are populated; the denominations are in decreasing size" do
      register = Register.new(200 => 1, 1 => 1, 5 => 1, 100 => 1, 50 => 1, 2 => 1, 10 => 1)
      expect(register.coin_denominations).to eql [200, 100, 50, 10, 5, 2, 1]
    end
  end

    describe "#make_change" do
      it "with 100 of each coin it should return the right change for 15.36 price and payment of 20" do
        expect(@register_with_100_of_each_coin.make_change({price: 15.36, payment: 20})).to eql({200 => 2, 50 => 1, 10 => 1, 2 =>2})
      end

      it "with 100 of each coin it should return the right change for 4.51 price and payment of 5" do
        expect(@register_with_100_of_each_coin.make_change({price: 4.51, payment: 5})).to eql({20 => 2, 5 => 1, 2 => 2})
      end

      it "with no 50p or 5p coins it should return the right change for 15.36 price and payment of 20" do
        expect(@register_with_no_50_or_5p_coins.make_change({price: 15.36, payment: 20})).to eql({200 => 2, 20 => 3, 2 =>2})
      end

      it "with no 50p or 5p coins it should return the right change for 4.51 price and payment of 5" do
        expect(@register_with_no_50_or_5p_coins.make_change({price: 4.51, payment: 5})).to eql({20 => 2, 2 => 4, 1 => 1})
      end

      it "with one of each coin (apart from 1p) it should return the right change for 4.51 price and payment of 5" do
        register = Register.new(200 => 1, 100 => 1, 50 => 1, 20 => 1, 10 => 1, 5=> 1, 2 => 1, 1 => 1000)
        expect(register.make_change({price: 4.51, payment: 5})).to eql({20 => 1, 10 => 1, 5 => 1, 2 => 1, 1 => 12})
      end

      it "raises an exception if it can't make change" do
        register = Register.new(1 => 1)
        expect{register.make_change({price: 4.51, payment: 5})}.to raise_error
      end
    end

  describe "#calculate change" do
    it "should take a price and payment in pence and return the difference" do
      expect(@register_with_100_of_each_coin.calculate_change(2000, 1001)).to eql 999
    end
  end


end