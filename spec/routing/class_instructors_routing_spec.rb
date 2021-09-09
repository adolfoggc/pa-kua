require "rails_helper"

RSpec.describe ClassInstructorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/class_instructors").to route_to("class_instructors#index")
    end

    it "routes to #new" do
      expect(get: "/class_instructors/new").to route_to("class_instructors#new")
    end

    it "routes to #show" do
      expect(get: "/class_instructors/1").to route_to("class_instructors#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/class_instructors/1/edit").to route_to("class_instructors#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/class_instructors").to route_to("class_instructors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/class_instructors/1").to route_to("class_instructors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/class_instructors/1").to route_to("class_instructors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/class_instructors/1").to route_to("class_instructors#destroy", id: "1")
    end
  end
end
