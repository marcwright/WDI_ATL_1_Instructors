require 'spec_helper'

describe Round do
  it { should ensure_length_of(:food_type).is_at_least(2).is_at_most(20) }
end
