require 'spec_helper'

describe Chef do

   it { should validate_presence_of(:name) }
   it { should validate_numericality_of(:age).only_integer }
   it { should validate_presence_of(:home_town) }
   it { should ensure_inclusion_of(:gender).in_array(%W(m f)) }
   it { should have_many(:dishes) }
   it { should belong_to(:episode) }
end
