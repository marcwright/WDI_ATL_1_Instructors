require "spec_helper"
require_relative "../lib/chopped"

describe Chef do
  it { should have_many(:dishes) }
  it { should have_many(:rounds).through(:dishes) }
  it { should validate_presence_of(:name)}
  it { should ensure_length_of(:name).is_at_least(3) }
end
