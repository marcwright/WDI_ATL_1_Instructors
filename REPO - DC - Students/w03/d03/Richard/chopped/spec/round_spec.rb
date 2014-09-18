require 'spec_helper'

describe Round do
   it { should validate_numericality_of(:time_limit).only_integer }
   it { should validate_numericality_of(:round_no).only_integer }
   it { should have_many(:dishes) }
   it { should belong_to(:episode) }
end
