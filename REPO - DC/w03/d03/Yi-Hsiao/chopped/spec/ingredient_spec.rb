require "spec_helper"
require_relative "../lib/chopped"

describe Ingredient do
  it { should have_and_belong_to_many(:rounds) }
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_least(3) }
  it { should validate_uniqueness_of(:name) }
end
