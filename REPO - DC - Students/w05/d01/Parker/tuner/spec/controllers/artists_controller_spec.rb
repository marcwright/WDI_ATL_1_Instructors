require 'spec_helper'

describe ArtistsController do

  describe "GET 'album'" do
    it "returns http success" do
      get 'album'
      response.should be_success
    end
  end

  describe "GET 'song'" do
    it "returns http success" do
      get 'song'
      response.should be_success
    end
  end

end
