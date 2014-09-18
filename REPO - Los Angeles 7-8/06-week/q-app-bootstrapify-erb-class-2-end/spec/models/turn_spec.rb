require 'rails_helper'

RSpec.describe Turn, :type => :model do
    it { should belong_to(:user) }

    before do

    end
    it "should be able to create a turn and be last in line" do

      turn = Turn.create!(subject: 'rails', question: 'what is rspec')

      queue = Turn.all

      expect(queue.last).to eq(turn)
    end

end
