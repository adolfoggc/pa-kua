require 'rails_helper'

RSpec.describe "discounts/edit", type: :view do
  before(:each) do
    @discount = assign(:discount, Discount.create!(
      discount_percentage: "9.99",
      kind_of_plan: 1
    ))
  end

  it "renders the edit discount form" do
    render

    assert_select "form[action=?][method=?]", discount_path(@discount), "post" do

      assert_select "input[name=?]", "discount[discount_percentage]"

      assert_select "input[name=?]", "discount[kind_of_plan]"
    end
  end
end
