require_relative 'spec_helper'
require_relative '../client'

describe Client do

  let(:client) {Client.new('Bill', 10_000)}

  before(:each) do
    Stock.stub(:quote).and_return(250)
  end

  describe '#initialize' do
    it 'creates a Client instance' do
      expect(client).to be_an_instance_of(Client)
    end

    it 'has no portfolios' do
      expect(client.portfolios.count).to eq 0
    end
  end

  describe '#name' do
    it 'has name'do
      expect(client.name).to eq 'Bill'
    end
  end

  describe '#balance' do
    it 'get the balance' do
      expect(client.balance).to eq 10_000
    end
  end

  describe '#deposit' do
    it 'adds funds to account' do
      client.deposit(500)
      expect(client.balance).to eq 10_500
    end
  end

  describe '#withdraw' do
    it 'withdraws funds from account' do
      client.withdraw(500)
      expect(client.balance).to eq 9500
    end

    it 'ignores requests for larger funds than are available' do
      client.withdraw(11_000)
      expect(client.balance).to eq 10_000
    end
  end

  describe '#can_purchase_stock?' do
    it 'does client have enough money to purchase stock' do
      expect(client.can_purchase_stock?(12_000)).to_not be true
    end
  end

  describe '#sell_stock_in_portfolio' do
    it 'number of stocks is reduced' do
      client.create_portfolio('Tech Stocks')
      client.add_stock_to_portfolio('Tech Stocks', 'AAPL', 10)
      client.sell_stock_in_portfolio('Tech Stocks', 'AAPL', 3)
      expect(client.portfolios['Tech Stocks'].stocks['AAPL'].shares).to eq 7
    end

    it 'balance increases after sale' do
      client.create_portfolio('Tech Stocks')
      client.add_stock_to_portfolio('Tech Stocks', 'AAPL', 10)
      client.sell_stock_in_portfolio('Tech Stocks', 'AAPL', 3)
      expect(client.balance).to eq 8250
    end

    it 'ignores request to sell more than available' do
      client.create_portfolio('Tech Stocks')
      client.add_stock_to_portfolio('Tech Stocks', 'AAPL', 10)
      client.sell_stock_in_portfolio('Tech Stocks', 'AAPL', 20)
      expect(client.balance).to eq 7500
    end
  end

  describe '#add_stock_to_portfolio' do
    it 'adds stock to a portfolio that exists' do
      client.create_portfolio('Tech Stocks')
      client.add_stock_to_portfolio('Tech Stocks', 'AAPL', 10)
      expect(client.portfolios['Tech Stocks'].stocks['AAPL'].shares).to eq 10
    end

    it 'ignores request to add stock to a portfolio that does not exists' do
      client.add_stock_to_portfolio('DOES NOT EXIST', 'AAPL', 10)
      expect(client.portfolios.count).to eq 0
    end

    it 'ignore request to add stock to portfolio if client does not have enough money' do
      client.create_portfolio('Tech Stocks')
      client.add_stock_to_portfolio('Tech Stocks', 'AAPL', 1000)
      expect(client.portfolios['Tech Stocks'].stocks.count).to eq 0
    end

    it 'balance is reduced after purchase made' do
      client.create_portfolio('Tech Stocks')
      client.add_stock_to_portfolio('Tech Stocks', 'AAPL', 10)
      expect(client.balance).to eq 7500
    end
  end

  describe '#position' do
    it 'returns the total amount of client assets' do
      client.create_portfolio('Tech Stocks')
      client.add_stock_to_portfolio('Tech Stocks', 'AAPL', 10)
      client.create_portfolio('Search')
      client.add_stock_to_portfolio('Search', 'GOOG', 5)
      expect(client.position).to eq 10_000
    end
  end

  describe '#create_portfolio' do
    it 'creates a portfolio for the client' do
      client.create_portfolio('Tech Stocks')
      client.create_portfolio('Tech Stocks')
      expect(client.portfolios.count).to eq 1
    end
  end
end
