require 'rails_helper'

RSpec.describe "class_instructors/index", type: :view do
  before(:each) do
    assign(:class_instructors, [
      ClassInstructor.create!(
        instructor: 2,
        pakua_class: nil
      ),
      ClassInstructor.create!(
        instructor: 2,
        pakua_class: nil
      )
    ])
  end

  it "renders a list of class_instructors" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
