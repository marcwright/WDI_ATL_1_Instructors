require "rails_helper"

RSpec.describe RappersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rappers").to route_to("rappers#index")
    end

    it "routes to #new" do
      expect(:get => "/rappers/new").to route_to("rappers#new")
    end

    it "routes to #show" do
      expect(:get => "/rappers/1").to route_to("rappers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rappers/1/edit").to route_to("rappers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rappers").to route_to("rappers#create")
    end

    it "routes to #update" do
      expect(:put => "/rappers/1").to route_to("rappers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rappers/1").to route_to("rappers#destroy", :id => "1")
    end

  end
end
