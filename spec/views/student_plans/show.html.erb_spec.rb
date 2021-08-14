require 'rails_helper'

RSpec.describe "student_plans/show", type: :view do
  before(:each) do
    @student_plan = assign(:student_plan, StudentPlan.create!(
      people: nil,
      tuition_fee: nil,
      discount: nil,
      rent_inclusion: "Rent Inclusion",
      due_day: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Rent Inclusion/)
    expect(rendered).to match(/2/)
  end
end
