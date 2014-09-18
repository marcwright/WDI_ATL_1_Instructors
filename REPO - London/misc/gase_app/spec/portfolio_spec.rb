require_relative 'spec_helper'
require_relative '../portfolio'

describe Portfolio do

  let(:portfolio) {Portfolio.new('Tech Stocks')}

  describe '#initialize' do
    it 'creates a Portfolio instance' do
      expect(portfolio).to be_an_instance_of(Portfolio)
    end

    it 'has no stock' do
      expect(portfolio.stocks.count).to eq 0
    end
  end

  describe '#stocks' do
    before(:each) do
      portfolio.buy_stock('AAPL', 20)
      portfolio.buy_stock('GOOG', 10)
      portfolio.buy_stock('AAPL', 15)
    end

    it 'count the number of stocks in an account' do
      expect(portfolio.stocks.count).to eq 2
    end

    it 'count number of shares in an account' do
      expect(portfolio.stocks['AAPL'].shares).to eq 35
    end
  end

  describe '#buy_stock' do
    it 'buys stock one time for a portfolio' do
      portfolio.buy_stock('AAPL', 18)
      expect(portfolio.stocks['AAPL'].shares).to eq 18
    end

    it 'buys the same stock many times for a portfolio' do
      portfolio.buy_stock('AAPL', 18)
      portfolio.buy_stock('AAPL', 12)
      expect(portfolio.stocks['AAPL'].shares).to eq 30
    end
  end

  describe '#sell_stock' do
    it 'sell stocks from a portfolio' do
      portfolio.buy_stock('AAPL', 10)
      portfolio.sell_stock('AAPL', 9)
      expect(portfolio.stocks['AAPL'].shares).to eq 1
    end

    it 'sell stocks from a portfolio and stock does not exist' do
      portfolio.sell_stock('XYZ', 100)
      expect(portfolio.stocks['XYZ']).to be nil
    end

    it 'sell stocks from a portfolio and not enough shares' do
      portfolio.buy_stock('AAPL', 10)
      portfolio.sell_stock('AAPL', 20)
      expect(portfolio.stocks['AAPL'].shares).to eq 10
    end
  end

  describe '#position' do
    it 'returns the position of the portfolio' do
      Stock.stub(:quote).and_return(300)
      portfolio.buy_stock('AAPL', 5)
      portfolio.buy_stock('AAPL', 5)
      portfolio.buy_stock('GOOG', 10)
      expect(portfolio.position).to eq 6000
    end
  end

  describe '#name' do
    it 'returns the name of the portfolio' do
      expect(portfolio.name).to eq 'Tech Stocks'
    end
  end
end
