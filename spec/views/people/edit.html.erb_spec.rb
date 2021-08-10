require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      name: "MyString",
      address: "MyString",
      phone: "MyString",
      cpf: "MyString",
      status: 1
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do

      assert_select "input[name=?]", "person[name]"

      assert_select "input[name=?]", "person[address]"

      assert_select "input[name=?]", "person[phone]"

      assert_select "input[name=?]", "person[cpf]"

      assert_select "input[name=?]", "person[status]"
    end
  end
end
