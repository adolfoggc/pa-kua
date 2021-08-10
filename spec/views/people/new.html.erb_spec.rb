require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      name: "MyString",
      address: "MyString",
      phone: "MyString",
      cpf: "MyString",
      status: 1
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input[name=?]", "person[name]"

      assert_select "input[name=?]", "person[address]"

      assert_select "input[name=?]", "person[phone]"

      assert_select "input[name=?]", "person[cpf]"

      assert_select "input[name=?]", "person[status]"
    end
  end
end
