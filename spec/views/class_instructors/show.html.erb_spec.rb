require 'rails_helper'

RSpec.describe "class_instructors/show", type: :view do
  before(:each) do
    @class_instructor = assign(:class_instructor, ClassInstructor.create!(
      instructor: 2,
      pakua_class: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
