require 'rails_helper'

RSpec.describe "rents/new", type: :view do
  before(:each) do
    assign(:rent, Rent.new(
      rental_amount: "9.99"
    ))
  end

  it "renders new rent form" do
    render

    assert_select "form[action=?][method=?]", rents_path, "post" do

      assert_select "input[name=?]", "rent[rental_amount]"
    end
  end
end
