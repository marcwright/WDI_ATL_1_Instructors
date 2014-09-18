require "spec_helper"
require_relative "../lib/chopped"

describe Dish do
  it { should belong_to(:chef) }
  it { should belong_to(:round) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:chopped) }
  it { should ensure_length_of(:name).is_at_least(3) }
  # it { should ensure_inclusion_of(:chopped).in_array([true, false]) }
end
