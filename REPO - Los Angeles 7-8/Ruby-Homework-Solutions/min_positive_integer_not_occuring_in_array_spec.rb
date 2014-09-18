require './min_positive_integer_not_occuring_in_array.rb'

describe 'solution' do
  it 'returns the smallest positive integer, not occuring in array' do
    a = [1, 3, 6, 4, 1, 2]
    expect(solution(a)).to eq(5)
  end
end
