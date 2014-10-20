require "spec_helper"

describe PlantasksController do
  describe "routing" do

    it "routes to #index" do
      get("/plantasks").should route_to("plantasks#index")
    end

    it "routes to #new" do
      get("/plantasks/new").should route_to("plantasks#new")
    end

    it "routes to #show" do
      get("/plantasks/1").should route_to("plantasks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/plantasks/1/edit").should route_to("plantasks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/plantasks").should route_to("plantasks#create")
    end

    it "routes to #update" do
      put("/plantasks/1").should route_to("plantasks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/plantasks/1").should route_to("plantasks#destroy", :id => "1")
    end

  end
end
