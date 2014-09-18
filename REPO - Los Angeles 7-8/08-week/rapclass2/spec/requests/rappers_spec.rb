require 'rails_helper'

RSpec.describe "Rappers", :type => :request do
  describe "GET /rappers" do
    it "works! (now write some real specs)" do
      get rappers_path
      expect(response.status).to be(200)
    end
  end
end
