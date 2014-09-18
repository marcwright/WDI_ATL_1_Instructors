require 'spec_helper'
require_relative "../lib/team"

describe Team do
  subject(:texans){ Team.new("Houston Texans") }

  describe "#draft" do

    it "increases the number of players on the roster by 1" do
      texans.draft("Jadeveon Clowney")
      expect(texans.roster.size).to eq(1)
    end

  end

end