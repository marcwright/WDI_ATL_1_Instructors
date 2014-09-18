require_relative 'spec_helper'
require_relative '../brokerage'

describe Brokerage do

  let(:brokerage) {Brokerage.new('Arthur Andersen')}

  describe '#initialize' do
    it 'creates a Brokerage instance' do
      expect(brokerage).to be_an_instance_of(Brokerage)
    end

    it 'has no clients' do
      expect(brokerage.clients.count).to eq 0
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(brokerage.name).to eq 'Arthur Andersen'
    end
  end

  describe '#client' do
    it 'gets the client' do
      brokerage.add_client('Bob', 200)
      expect(brokerage.client('Bob').name).to eq 'Bob'
    end
  end

  describe '#add_client' do
    it 'adds a client to the brokerage' do
      brokerage.add_client('Bob', 200)
      brokerage.add_client('Bob', 300)
      brokerage.add_client('Sally', 500)
      expect(brokerage.clients.count).to eq 2
    end
  end
end
