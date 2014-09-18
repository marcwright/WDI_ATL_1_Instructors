require './missing_numbers.rb'

describe 'solution' do
  it 'should return the missing numbers' do
    a = [203, 204, 205, 206, 207, 208, 203, 204, 205, 206]
    b = [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 205, 206, 204]
    expect(solution(a, b)).to eq([204,205,206])
  end
end
