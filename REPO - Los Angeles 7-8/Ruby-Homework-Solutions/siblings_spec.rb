require './siblings.rb'

describe 'solution' do
  it 'returns the the largest sibling' do
    expect(solution(213)).to eq(321)
  end
  it 'should return -1 if the result exceeds 100,000,000' do
    expect(solution(2147483647)).to eq(-1)
  end
end
