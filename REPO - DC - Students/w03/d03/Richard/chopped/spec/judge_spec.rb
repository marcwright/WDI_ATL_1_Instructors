require 'spec_helper'

describe Judge do
  it { should validate_presence_of(:name) }
   it { should validate_numericality_of(:age).only_integer }
   it { should validate_presence_of(:profession) }
   it { should validate_presence_of(:nationality) }
   it { should have_many(:scores) }
   it { should have_many(:episodes).through(:judgment) }
end
