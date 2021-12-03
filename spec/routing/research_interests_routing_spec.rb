require "rails_helper"

RSpec.describe ResearchInterestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/research_interests").to route_to("research_interests#index")
    end

    it "routes to #new" do
      expect(:get => "/research_interests/new").to route_to("research_interests#new")
    end

    it "routes to #show" do
      expect(:get => "/research_interests/1").to route_to("research_interests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/research_interests/1/edit").to route_to("research_interests#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/research_interests").to route_to("research_interests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/research_interests/1").to route_to("research_interests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/research_interests/1").to route_to("research_interests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/research_interests/1").to route_to("research_interests#destroy", :id => "1")
    end

  end
end
