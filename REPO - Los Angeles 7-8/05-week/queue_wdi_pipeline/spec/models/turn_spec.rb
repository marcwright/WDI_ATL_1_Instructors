require 'rails_helper'

RSpec.describe Turn, :type => :model do
  context "when awaiting to be put on a queue" do

    it { should validate_presence_of(:name) }
    it "should be able to create a turn and be last in line" do
      turn = Turn.create!(name: 'jonny', subject: '', question: '')

      queue = Turn.all

      expect(queue.last).to eq(turn)
    end
  end
end
