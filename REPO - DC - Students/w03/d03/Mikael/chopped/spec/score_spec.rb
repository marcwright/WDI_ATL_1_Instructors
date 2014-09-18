require 'spec_helper'

describe Score do
  it {should validate_presence_of(:value)}
  it {should belong_to(:dish)}
  it {should belong_to(:judge)}
  it {should validate_numericality_of(:value).only_integer }
end
