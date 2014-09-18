require 'spec_helper'

describe Judge do
  let(:judge) { Judge.new }

  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_most(100) }

end

# describe Dish < ActiveRecord::Base
# end

# describe Round < ActiveRecord::Base
#   has_many :chefs
# end

# describe Score < ActiveRecord::Base
# end
