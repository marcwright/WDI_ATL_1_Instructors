require 'spec_helper'
require_relative '../lib/eg.rb'

describe student do
  let(:student) { student.new }

    it { should ensure_length_of(:name).is_at_least(1) }
    it { should validate_numericality_of(:knowledge).
      is_equal_to(100) }
    it { should validate_numericality_of(:energy).is_less_than(0) }
  end
end
