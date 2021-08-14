require "rails_helper"

RSpec.describe StudentPlansController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/student_plans").to route_to("student_plans#index")
    end

    it "routes to #new" do
      expect(get: "/student_plans/new").to route_to("student_plans#new")
    end

    it "routes to #show" do
      expect(get: "/student_plans/1").to route_to("student_plans#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/student_plans/1/edit").to route_to("student_plans#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/student_plans").to route_to("student_plans#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/student_plans/1").to route_to("student_plans#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/student_plans/1").to route_to("student_plans#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/student_plans/1").to route_to("student_plans#destroy", id: "1")
    end
  end
end
