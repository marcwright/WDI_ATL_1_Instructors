require 'spec_helper'

describe Episode do
   it { should validate_presence_of(:episode_no) }
   it { should validate_presence_of(:season_no) }
   it { should have_many(:chefs) }
   it { should have_many(:judges).through(:judgment) }
   it { should have_many(:rounds) }
end
