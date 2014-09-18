require 'spec_helper'

describe Round do
  it { should belong_to(:episode) }
  it { should have_many(:dish) }
end
