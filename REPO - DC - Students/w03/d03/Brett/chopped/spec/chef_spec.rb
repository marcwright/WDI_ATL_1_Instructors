require 'spec_helper'

describe Contestant do
  it { should ensure_length_of(:name).is_at_least(2).is_at_most(20) }
end
