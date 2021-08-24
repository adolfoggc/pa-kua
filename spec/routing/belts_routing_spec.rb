require "rails_helper"

RSpec.describe BeltsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/belts").to route_to("belts#index")
    end

    it "routes to #new" do
      expect(get: "/belts/new").to route_to("belts#new")
    end

    it "routes to #show" do
      expect(get: "/belts/1").to route_to("belts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/belts/1/edit").to route_to("belts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/belts").to route_to("belts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/belts/1").to route_to("belts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/belts/1").to route_to("belts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/belts/1").to route_to("belts#destroy", id: "1")
    end
  end
end
