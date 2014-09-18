require 'spec_helper'

describe Episode do
  it { should have_many(:round) }
end
