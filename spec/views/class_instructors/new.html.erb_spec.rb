require 'rails_helper'

RSpec.describe "class_instructors/new", type: :view do
  before(:each) do
    assign(:class_instructor, ClassInstructor.new(
      instructor: 1,
      pakua_class: nil
    ))
  end

  it "renders new class_instructor form" do
    render

    assert_select "form[action=?][method=?]", class_instructors_path, "post" do

      assert_select "input[name=?]", "class_instructor[instructor]"

      assert_select "input[name=?]", "class_instructor[pakua_class_id]"
    end
  end
end
