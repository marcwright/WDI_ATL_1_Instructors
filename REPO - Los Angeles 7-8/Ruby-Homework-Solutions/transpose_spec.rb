require './transpose.rb'

describe 'solution' do
  it 'turns the array 90 degrees' do
    expect(solution([[1,2,3],[4,5,6],[7,8,9]])).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
  end
end
