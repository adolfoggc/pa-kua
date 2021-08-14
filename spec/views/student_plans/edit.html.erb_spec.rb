require 'rails_helper'

RSpec.describe "student_plans/edit", type: :view do
  before(:each) do
    @student_plan = assign(:student_plan, StudentPlan.create!(
      people: nil,
      tuition_fee: nil,
      discount: nil,
      rent_inclusion: "MyString",
      due_day: 1
    ))
  end

  it "renders the edit student_plan form" do
    render

    assert_select "form[action=?][method=?]", student_plan_path(@student_plan), "post" do

      assert_select "input[name=?]", "student_plan[people_id]"

      assert_select "input[name=?]", "student_plan[tuition_fee_id]"

      assert_select "input[name=?]", "student_plan[discount_id]"

      assert_select "input[name=?]", "student_plan[rent_inclusion]"

      assert_select "input[name=?]", "student_plan[due_day]"
    end
  end
end
