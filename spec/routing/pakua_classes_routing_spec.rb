require "rails_helper"

RSpec.describe PakuaClassesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/pakua_classes").to route_to("pakua_classes#index")
    end

    it "routes to #new" do
      expect(get: "/pakua_classes/new").to route_to("pakua_classes#new")
    end

    it "routes to #show" do
      expect(get: "/pakua_classes/1").to route_to("pakua_classes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/pakua_classes/1/edit").to route_to("pakua_classes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/pakua_classes").to route_to("pakua_classes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/pakua_classes/1").to route_to("pakua_classes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/pakua_classes/1").to route_to("pakua_classes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/pakua_classes/1").to route_to("pakua_classes#destroy", id: "1")
    end
  end
end
