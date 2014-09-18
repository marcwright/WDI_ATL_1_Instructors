require 'spec_helper'

describe Score do
  it { should ensure_inclusion_of(:points).in_range(1..5) }
end
