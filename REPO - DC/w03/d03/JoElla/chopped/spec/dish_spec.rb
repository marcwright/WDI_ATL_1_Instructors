require 'spec_helper'

describe Dish do
  it { should belong_to(:round) }
  it { should belong_to(:chef) }
  it { should have_many(:score) }
end
