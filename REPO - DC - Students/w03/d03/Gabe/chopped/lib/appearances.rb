require 'spec_helper'

describe Appearance do
  let(:appearance) { Appearance.new }

  it { should belong_to(:round) }
  it { should belong_to(:chef) }

end
