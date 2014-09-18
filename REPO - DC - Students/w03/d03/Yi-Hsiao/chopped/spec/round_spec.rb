require "spec_helper"
require_relative "../lib/chopped"

describe Round do
  it { should have_many(:dishes) }
  it { should have_and_belong_to_many(:ingredients) }
  it { should validate_presence_of(:episode_no) }
  it { should validate_presence_of(:round) }
  it { should validate_numericality_of(:episode_no).only_integer }
  it { should validate_numericality_of(:episode_no).is_greater_than(0) }
  it { should ensure_inclusion_of(:round).in_array(%w(appetizer entree dessert)) }
end
