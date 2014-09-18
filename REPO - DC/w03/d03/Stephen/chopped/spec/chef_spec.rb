require 'spec_helper'

describe Chef do
  it { should ensure_length_of(:name).is_at_least(2).is_at_most(20) }
  # it { should validate_absence_of(:alive_status) }
end
