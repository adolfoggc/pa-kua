require 'rails_helper'

RSpec.describe "class_instructors/edit", type: :view do
  before(:each) do
    @class_instructor = assign(:class_instructor, ClassInstructor.create!(
      instructor: 1,
      pakua_class: nil
    ))
  end

  it "renders the edit class_instructor form" do
    render

    assert_select "form[action=?][method=?]", class_instructor_path(@class_instructor), "post" do

      assert_select "input[name=?]", "class_instructor[instructor]"

      assert_select "input[name=?]", "class_instructor[pakua_class_id]"
    end
  end
end
