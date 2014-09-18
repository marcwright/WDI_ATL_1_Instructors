require_relative 'spec_helper'
require_relative '../stock'

describe Stock do

  let(:stock) {Stock.new('AAPL', 10)}

  describe '#initialize' do
    it 'creates a Stock instance' do
      expect(stock).to be_an_instance_of(Stock)
    end
  end

  describe '#symbol' do
    it 'returns ths stock symbol' do
      expect(stock.symbol).to eq 'AAPL'
    end
  end

  describe '#shares' do
    it 'returns number of shares in stock' do
      expect(stock.shares).to eq 10
    end
  end

  describe '#name' do
    it 'returns name of stock' do
      Stock.stub(:get_standard_quotes).and_return({name: 'Apple Inc.'})
      expect(stock.name).to eq 'Apple Inc.'
    end
  end

  describe '#buy' do
    it 'buy additional shares' do
      stock.buy(10)
      expect(stock.shares).to eq 20
    end
  end

  describe '#sell' do
    it 'sell shares if available' do
      stock.sell(7)
      expect(stock.shares).to eq 3
    end

    it 'ignore selling if shares not available' do
      stock.sell(11)
      expect(stock.shares).to eq 10
    end
  end

  describe '#quote' do
    it 'gets a single quote for a stock symbol' do
      expect(Stock.quote('AAPL')).to be >= 0
    end
  end

  describe '#get_standard_quotes' do
    it 'returns the stock quote hash' do
      Stock.stub(:get_standard_quotes).and_return({name: 'Apple Inc.'})
      expect(Stock.get_standard_quotes('AAPL')).to be_an_instance_of(Hash)
    end
  end


  describe '#position' do
    it 'returns the position for the stock' do
      Stock.stub(:quote).and_return(250)
      expect(stock.position).to eq 2500
    end
  end
end
