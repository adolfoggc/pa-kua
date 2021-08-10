require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        name: "Name",
        address: "Address",
        phone: "Phone",
        cpf: "Cpf",
        status: 2
      ),
      Person.create!(
        name: "Name",
        address: "Address",
        phone: "Phone",
        cpf: "Cpf",
        status: 2
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: "Phone".to_s, count: 2
    assert_select "tr>td", text: "Cpf".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
