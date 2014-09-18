require './anagram.rb'

describe 'solution' do
  it 'should return 1 for anagram of palindrome' do
    expect(solution('dooernedeevrvn')).to eq(1)
  end
  it 'should return 0' do
    expect(solution('aabcba')).to eq(0)
  end
  it 'kayak should return 1' do
    expect(solution('kayak')).to eq(1)
  end
  it 'anna should return 1' do
    expect(solution('anna')).to eq(1)
  end
  it 'rocketboys should return 0' do
    expect(solution('rocketboys')).to eq(0)
  end
end
