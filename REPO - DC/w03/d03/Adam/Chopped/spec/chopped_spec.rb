require 'spec_helper'

describe Chef do
  it { should have_many(:dishes) }
end

describe Dish do
  it { should have_many(:scores) }
  it { should belong_to(:round) }
  it { should belong_to(:chef) }
end

describe Judge do
  it { should have_many(:scores) }
end

describe Round do
  it { should have_many(:dishes) }
end

describe Score do
  it { should belong_to(:judge) }
  it { should belong_to(:dish) }
end

