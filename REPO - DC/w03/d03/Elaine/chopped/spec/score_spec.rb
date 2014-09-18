require 'spec_helper'
# require_relative '../lib/chopped.rb'

describe Score do
  let(:score) { Score.new }

  it { should validate_numericality_of(:value).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:value).is_less_than_or_equal_to(5) }
end
