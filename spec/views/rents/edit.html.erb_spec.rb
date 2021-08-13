require 'rails_helper'

RSpec.describe "rents/edit", type: :view do
  before(:each) do
    @rent = assign(:rent, Rent.create!(
      rental_amount: "9.99"
    ))
  end

  it "renders the edit rent form" do
    render

    assert_select "form[action=?][method=?]", rent_path(@rent), "post" do

      assert_select "input[name=?]", "rent[rental_amount]"
    end
  end
end
