require './factorial.rb'

describe 'fac' do
  it 'returns the result of 5!' do
    expect(fac(5)).to eq(120)
  end
end
