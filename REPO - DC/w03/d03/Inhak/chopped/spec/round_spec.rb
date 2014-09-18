require 'spec_helper'

describe Round do
  it{should validate_presence_of(:time_limit)}
  it{should validate_presence_of(:round_num)}
  it{should have_many(:dishes)}
  it{should belong_to(:episode)}
end
