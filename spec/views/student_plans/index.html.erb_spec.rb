require 'rails_helper'

RSpec.describe "student_plans/index", type: :view do
  before(:each) do
    assign(:student_plans, [
      StudentPlan.create!(
        people: nil,
        tuition_fee: nil,
        discount: nil,
        rent_inclusion: "Rent Inclusion",
        due_day: 2
      ),
      StudentPlan.create!(
        people: nil,
        tuition_fee: nil,
        discount: nil,
        rent_inclusion: "Rent Inclusion",
        due_day: 2
      )
    ])
  end

  it "renders a list of student_plans" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Rent Inclusion".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
