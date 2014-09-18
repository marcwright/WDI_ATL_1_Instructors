require 'spec_helper'

describe Chef do
  let(:chef) { Chef.new }

  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_most(100) }

end
